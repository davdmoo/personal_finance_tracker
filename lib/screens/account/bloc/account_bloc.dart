import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../database.dart';

part 'account_bloc.freezed.dart';
part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AppDatabase db;

  AccountBloc(this.db) : super(_AccountState()) {
    on<AccountEvent>((events, emit) async {
      await events.map<FutureOr<void>>(
        started: (event) async => await _onStarted(event, emit),
      );
    });
  }

  Future<void> _onStarted(event, Emitter<AccountState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final accounts = await db.select(db.accounts).get();

      emit(state.copyWith(accounts: accounts));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
