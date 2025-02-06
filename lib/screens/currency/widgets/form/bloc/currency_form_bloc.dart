import 'dart:async';

import 'package:drift/drift.dart' as drift;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../database.dart';
import '../../../../../extensions/string.extensions.dart';

part 'currency_form_bloc.freezed.dart';
part 'currency_form_event.dart';
part 'currency_form_state.dart';

class CurrencyFormBloc extends Bloc<CurrencyFormEvent, CurrencyFormState> {
  final AppDatabase db;
  final Currency? currency;

  CurrencyFormBloc({required this.db, this.currency}) : super(_CurrencyFormState()) {
    on<CurrencyFormEvent>((events, emit) async {
      await events.map<FutureOr<void>>(
        started: (event) => null,
        formSubmitted: (event) async => await _onFormSubmitted(event, emit),
      );
    });
  }

  Future<void> _onFormSubmitted(_FormSubmitted event, Emitter<CurrencyFormState> emit) async {
    try {
      emit(state.copyWith(isSaving: true));

      final currency = this.currency;
      if (currency == null) {
        // get the latest order from all accounts
        final data = CurrenciesCompanion.insert(name: event.name.capitalized.trim(), code: event.code);
        final newCurrency = await db.into(db.currencies).insertReturning(data);

        emit(state.copyWith(savedCurrency: newCurrency));
      } else {
        final data = CurrenciesCompanion(
          name: drift.Value(event.name.capitalized.trim()),
          code: drift.Value(event.code),
        );
        final query = db.update(db.currencies)..where((tbl) => tbl.id.equals(currency.id));
        final result = await query.writeReturning(data);

        final updatedCurrency = result.firstOrNull;
        if (updatedCurrency == null) {
          throw Exception("Currency is missing. It may have been deleted.");
        }

        emit(state.copyWith(savedCurrency: updatedCurrency));
      }
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isSaving: false));
    }
  }
}
