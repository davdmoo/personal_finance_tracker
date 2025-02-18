import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../database.dart';
import '../../../logics/account_group.logic.dart';

part 'account_group_bloc.freezed.dart';
part 'account_group_event.dart';
part 'account_group_state.dart';

class AccountGroupBloc extends Bloc<AccountGroupEvent, AccountGroupState> {
  final AccountGroupLogic accountGroupLogic;

  AccountGroupBloc(this.accountGroupLogic) : super(_AccountGroupState()) {
    on<AccountGroupEvent>(
      (events, emit) async {
        await events.map<FutureOr<void>>(
          started: (event) async => await _onStarted(event, emit),
          reordered: (event) async => await _onReordered(event, emit),
        );
      },
    );
  }

  Future<void> _onStarted(_Started event, Emitter<AccountGroupState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final accountGroups = await accountGroupLogic.findAll();

      emit(state.copyWith(accountGroups: accountGroups));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onReordered(_Reordered event, Emitter<AccountGroupState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final oldIndex = event.oldIndex;
      int newIndex = event.newIndex;
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }

      final accountGroups = [...state.accountGroups];
      final movedCategory = accountGroups.removeAt(oldIndex);
      accountGroups.insert(newIndex, movedCategory);
      emit(state.copyWith(accountGroups: accountGroups)); // emit for local state so the list doesnt "flicker"

      final updatedAccountGroups = await accountGroupLogic.reorder(accountGroups);
      emit(state.copyWith(accountGroups: updatedAccountGroups));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
