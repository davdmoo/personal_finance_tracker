import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../database.dart';
import '../../../../../logics/account.logic.dart';
import '../../../../../logics/account_group.logic.dart';

part 'account_form_bloc.freezed.dart';
part 'account_form_event.dart';
part 'account_form_state.dart';

class AccountFormBloc extends Bloc<AccountFormEvent, AccountFormState> {
  final AccountGroupLogic accountGroupLogic;
  final AccountLogic accountLogic;

  final Account? account;

  AccountFormBloc({
    required this.accountGroupLogic,
    required this.accountLogic,
    this.account,
  }) : super(_AccountFormState()) {
    on<AccountFormEvent>((events, emit) async {
      await events.map<FutureOr<void>>(
        started: (event) async => await _onStarted(event, emit),
        formSubmitted: (event) async => await _onFormSubmitted(event, emit),
      );
    });
  }

  Future<void> _onStarted(_Started event, Emitter<AccountFormState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final accountGroups = await accountGroupLogic.findAll();

      emit(state.copyWith(accountGroups: accountGroups));
    } catch (err) {
      emit(state.copyWith(error: Exception(err.toString())));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onFormSubmitted(_FormSubmitted event, Emitter<AccountFormState> emit) async {
    try {
      emit(state.copyWith(isSaving: true));

      final account = this.account;
      if (account == null) {
        final newAccount = await accountLogic.create(accountGroup: event.accountGroup.id, name: event.name);

        emit(state.copyWith(savedAccount: newAccount));
      } else {
        final updatedAccount = await accountLogic.update(
          accountGroup: event.accountGroup.id,
          name: event.name,
          id: account.id,
        );

        emit(state.copyWith(savedAccount: updatedAccount));
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
