import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../database.dart';
import '../../../logics/expense.logic.dart';
import '../../../logics/income.logic.dart';
import '../../../logics/transfer.logic.dart';

part 'transaction_list_bloc.freezed.dart';
part 'transaction_list_event.dart';
part 'transaction_list_state.dart';

class TransactionListBloc extends Bloc<TransactionListEvent, TransactionListState> {
  final ExpenseLogic expenseLogic;
  final IncomeLogic incomeLogic;
  final TransferLogic transferLogic;

  TransactionListBloc({
    required this.expenseLogic,
    required this.incomeLogic,
    required this.transferLogic,
  }) : super(_TransactionListState()) {
    on<TransactionListEvent>((events, emit) async {
      await events.map<FutureOr<void>>(started: (event) async => await _onStarted(event, emit));
    });
  }

  Future<void> _onStarted(_Started event, Emitter<TransactionListState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final expenses = await expenseLogic.findAll();
      final incomes = await incomeLogic.findAll();
      final transfers = await transferLogic.findAll();

      emit(state.copyWith(expenses: expenses, incomes: incomes, transfers: transfers));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
