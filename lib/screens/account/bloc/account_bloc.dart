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
}
