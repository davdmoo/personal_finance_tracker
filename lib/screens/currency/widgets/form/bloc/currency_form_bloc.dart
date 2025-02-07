import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../database.dart';
import '../../../../../logics/currency.logic.dart';

part 'currency_form_bloc.freezed.dart';
part 'currency_form_event.dart';
part 'currency_form_state.dart';

class CurrencyFormBloc extends Bloc<CurrencyFormEvent, CurrencyFormState> {
  final CurrencyLogic currencyLogic;
  final Currency? currency;

  CurrencyFormBloc({required this.currencyLogic, this.currency}) : super(_CurrencyFormState()) {
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
        final newCurrency = await currencyLogic.create(name: event.name, code: event.code);

        emit(state.copyWith(savedCurrency: newCurrency));
      } else {
        final updatedCurrency = await currencyLogic.update(id: currency.id, name: event.name, code: event.code);

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
