import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../database.dart';

part 'account_group_bloc.freezed.dart';
part 'account_group_event.dart';
part 'account_group_state.dart';

class AccountGroupBloc extends Bloc<AccountGroupEvent, AccountGroupState> {
  final AppDatabase db;

  AccountGroupBloc(this.db) : super(_AccountGroupState()) {
    on<AccountGroupEvent>(
      (events, emit) async {
        await events.map<FutureOr<void>>(
          started: (event) async => await _onStarted(event, emit),
        );
      },
    );
  }

  Future<void> _onStarted(_Started event, Emitter<AccountGroupState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final accountGroups = await db.select(db.accountGroups).get();

      emit(state.copyWith(accountGroups: accountGroups));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
