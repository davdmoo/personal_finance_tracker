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
      await events.map<FutureOr<void>>(
        started: (event) async => await _onStarted(event, emit),
        expenseDeleted: (event) async => await _onExpenseDeleted(event, emit),
        incomeDeleted: (event) async => await _onIncomeDeleted(event, emit),
        transferDeleted: (event) async => await _onTransferDeleted(event, emit),
      );
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

  Future<void> _onExpenseDeleted(_ExpenseDeleted event, Emitter<TransactionListState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      /// dismissible widget needs to be immediately removed once handler was fired
      /// so we try to remove and emit the expenses first before then fetching the updated list
      List<PopulatedExpense> expenses = [...state.expenses];
      expenses.removeWhere((el) => el.expense.id == event.id);
      emit(state.copyWith(expenses: expenses));

      await expenseLogic.deleteById(event.id);

      expenses = await expenseLogic.findAll();

      emit(state.copyWith(expenses: expenses));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onIncomeDeleted(_IncomeDeleted event, Emitter<TransactionListState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      /// dismissible widget needs to be immediately removed once handler was fired
      /// so we try to remove and emit the expenses first before then fetching the updated list
      List<PopulatedIncome> incomes = [...state.incomes];
      incomes.removeWhere((el) => el.income.id == event.id);
      emit(state.copyWith(incomes: incomes));

      await incomeLogic.deleteById(event.id);

      incomes = await incomeLogic.findAll();

      emit(state.copyWith(incomes: incomes));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onTransferDeleted(_TransferDeleted event, Emitter<TransactionListState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      /// dismissible widget needs to be immediately removed once handler was fired
      /// so we try to remove and emit the expenses first before then fetching the updated list
      List<PopulatedTransfer> transfers = [...state.transfers];
      transfers.removeWhere((el) => el.transfer.id == event.id);
      emit(state.copyWith(transfers: transfers));

      await transferLogic.deleteById(event.id);

      transfers = await transferLogic.findAll();

      emit(state.copyWith(transfers: transfers));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
