import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../logics/account.logic.dart';
import '../../../models/account_balance.model.dart';

part 'account_bloc.freezed.dart';
part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountLogic accountLogic;

  AccountBloc(this.accountLogic) : super(_AccountState()) {
    on<AccountEvent>((events, emit) async {
      await events.map<FutureOr<void>>(
        started: (event) async => await _onStarted(event, emit),
        reordered: (event) async => await _onReordered(event, emit),
      );
    });
  }

  Future<void> _onStarted(_Started event, Emitter<AccountState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final accounts = await accountLogic.findAll();

      final List<AccountBalance> balancedAccounts = [];
      for (final account in accounts) {
        final totalBalance = await accountLogic.getAccountBalance(account);
        balancedAccounts.add(AccountBalance(account: account, balance: totalBalance));
      }

      emit(state.copyWith(accounts: balancedAccounts));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onReordered(_Reordered event, Emitter<AccountState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final oldIndex = event.oldIndex;
      int newIndex = event.newIndex;
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }

      final accounts = [...state.accounts];
      final movedCategory = accounts.removeAt(oldIndex);
      accounts.insert(newIndex, movedCategory);
      emit(state.copyWith(accounts: accounts)); // emit for local state so the list doesnt "flicker"

      final updatedAccounts = await accountLogic.reorder(accounts.map((el) => el.account).toList());
      final List<AccountBalance> balancedAccounts = [];
      for (final account in updatedAccounts) {
        final totalBalance = await accountLogic.getAccountBalance(account);
        balancedAccounts.add(AccountBalance(account: account, balance: totalBalance));
      }

      emit(state.copyWith(accounts: balancedAccounts));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
