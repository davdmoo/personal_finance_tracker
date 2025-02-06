import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../database.dart';

part 'currency_list_bloc.freezed.dart';
part 'currency_list_event.dart';
part 'currency_list_state.dart';

class CurrencyListBloc extends Bloc<CurrencyListEvent, CurrencyListState> {
  final AppDatabase db;

  CurrencyListBloc(this.db) : super(_CurrencyListState()) {
    on<CurrencyListEvent>((events, emit) async {
      await events.map<FutureOr<void>>(
        started: (event) async => await _onStarted(event, emit),
      );
    });
  }

  Future<void> _onStarted(_Started event, Emitter<CurrencyListState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final currencies = await db.select(db.currencies).get();

      emit(state.copyWith(currencies: currencies));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
