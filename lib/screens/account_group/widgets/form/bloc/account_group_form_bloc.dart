import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../database.dart';
import '../../../../../logics/account_group.logic.dart';

part 'account_group_form_bloc.freezed.dart';
part 'account_group_form_event.dart';
part 'account_group_form_state.dart';

class AccountGroupFormBloc extends Bloc<AccountGroupFormEvent, AccountGroupFormState> {
  final AccountGroupLogic accountGroupLogic;
  final AccountGroup? accountGroup;

  AccountGroupFormBloc({required this.accountGroupLogic, this.accountGroup}) : super(_AccountGroupFormState()) {
    on<AccountGroupFormEvent>(
      (events, emit) async {
        await events.map<FutureOr<void>>(
          started: (event) async => await _onStarted(event, emit),
          formSubmitted: (event) async => await _onFormSubmitted(event, emit),
        );
      },
    );
  }

  Future<void> _onStarted(_Started event, Emitter<AccountGroupFormState> emit) async {}

  Future<void> _onFormSubmitted(_FormSubmitted event, Emitter<AccountGroupFormState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final accountGroup = this.accountGroup;
      if (accountGroup == null) {
        final insertedData = await accountGroupLogic.create(name: event.name);

        emit(state.copyWith(savedAccountGroup: insertedData));
      } else {
        final updatedAccountGroup = await accountGroupLogic.update(id: accountGroup.id, name: event.name);

        emit(state.copyWith(savedAccountGroup: updatedAccountGroup));
      }
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
