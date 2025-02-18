import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../database.dart';
import '../../../logics/account.logic.dart';
import '../../../logics/currency.logic.dart';
import '../../../logics/default_currency.logic.dart';
import '../../../logics/expense.logic.dart';
import '../../../logics/expense_category.logic.dart';
import '../../../logics/income.logic.dart';
import '../../../logics/income_category.logic.dart';
import '../../../logics/transfer.logic.dart';

part 'transaction_form_bloc.freezed.dart';
part 'transaction_form_event.dart';
part 'transaction_form_state.dart';

class TransactionFormBloc extends Bloc<TransactionFormEvent, TransactionFormState> {
  final ExpenseLogic expenseLogic;
  final IncomeLogic incomeLogic;
  final TransferLogic transferLogic;
  final DefaultCurrencyLogic defaultCurrencyLogic;

  final AccountLogic accountLogic;
  final ExpenseCategoryLogic expenseCategoryLogic;
  final IncomeCategoryLogic incomeCategoryLogic;
  final CurrencyLogic currencyLogic;

  final PopulatedExpense? populatedExpense;
  final PopulatedIncome? populatedIncome;
  final PopulatedTransfer? populatedTransfer;

  TransactionFormBloc({
    required this.expenseLogic,
    required this.incomeLogic,
    required this.transferLogic,
    required this.accountLogic,
    required this.expenseCategoryLogic,
    required this.incomeCategoryLogic,
    required this.currencyLogic,
    required this.defaultCurrencyLogic,
    this.populatedExpense,
    this.populatedIncome,
    this.populatedTransfer,
  }) : super(_TransactionFormState()) {
    on<TransactionFormEvent>((events, emit) async {
      await events.map<FutureOr<void>>(
        started: (event) async => await _onStarted(event, emit),
        expenseFormSubmitted: (event) async => await _onExpenseFormSubmitted(event, emit),
        incomeFormSubmitted: (event) async => await _onIncomeFormSubmitted(event, emit),
        transferFormSubmitted: (event) async => await _onTransferFormSubmitted(event, emit),
      );
    });
  }

  Future<void> _onStarted(_Started event, Emitter<TransactionFormState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final accounts = await accountLogic.findAll();
      emit(state.copyWith(accounts: accounts));

      final expenseCats = await expenseCategoryLogic.findAll();
      emit(state.copyWith(expenseCategories: expenseCats));

      final incomeCats = await incomeCategoryLogic.findAll();
      emit(state.copyWith(incomeCategories: incomeCats));

      final currencies = await currencyLogic.findAll();
      emit(state.copyWith(currencies: currencies));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onExpenseFormSubmitted(_ExpenseFormSubmitted event, Emitter<TransactionFormState> emit) async {
    try {
      emit(state.copyWith(isSaving: true));

      final defaultCurrency = await defaultCurrencyLogic.getDefaultCurrency();

      final populatedExpense = this.populatedExpense;
      if (populatedExpense == null) {
        final newExpense = await expenseLogic.create(
          accountId: event.account.id,
          amount: event.amount,
          currencyId: defaultCurrency!.id,
          expenseCategoryId: event.category.id,
          transactionDate: event.transactionDate,
          note: event.note,
        );

        emit(state.copyWith(savedExpense: newExpense));
      } else {
        final updatedExpense = await expenseLogic.update(
          id: populatedExpense.expense.id,
          accountId: event.account.id,
          amount: event.amount,
          currencyId: defaultCurrency!.id,
          expenseCategoryId: event.category.id,
          transactionDate: event.transactionDate,
          note: event.note,
        );

        emit(state.copyWith(savedExpense: updatedExpense));
      }
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isSaving: false));
    }
  }

  Future<void> _onIncomeFormSubmitted(_IncomeFormSubmitted event, Emitter<TransactionFormState> emit) async {
    try {
      emit(state.copyWith(isSaving: true));

      final defaultCurrency = await defaultCurrencyLogic.getDefaultCurrency();

      final populatedIncome = this.populatedIncome;
      if (populatedIncome == null) {
        final newIncome = await incomeLogic.create(
          accountId: event.account.id,
          amount: event.amount,
          currencyId: defaultCurrency!.id,
          expenseCategoryId: event.category.id,
          transactionDate: event.transactionDate,
          note: event.note,
        );

        emit(state.copyWith(savedIncome: newIncome));
      } else {
        final updatedIncome = await incomeLogic.update(
          id: populatedIncome.income.id,
          accountId: event.account.id,
          amount: event.amount,
          currencyId: defaultCurrency!.id,
          incomeCategoryId: event.category.id,
          transactionDate: event.transactionDate,
          note: event.note,
        );

        emit(state.copyWith(savedIncome: updatedIncome));
      }
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isSaving: false));
    }
  }

  Future<void> _onTransferFormSubmitted(_TransferFormSubmitted event, Emitter<TransactionFormState> emit) async {
    try {
      emit(state.copyWith(isSaving: true));

      final defaultCurrency = await defaultCurrencyLogic.getDefaultCurrency();

      final populatedTransfer = this.populatedTransfer;
      if (populatedTransfer == null) {
        final newTransfer = await transferLogic.create(
          accountOrigin: event.accountOrigin.id,
          accountDestination: event.accountDestination.id,
          currency: defaultCurrency!.id,
          amount: event.amount,
          fee: event.fee,
          note: event.note,
          transactionDate: event.transactionDate,
        );

        emit(state.copyWith(savedTransfer: newTransfer));
      } else {
        final updatedTransfer = await transferLogic.update(
          id: populatedTransfer.transfer.id,
          accountOrigin: event.accountOrigin.id,
          accountDestination: event.accountDestination.id,
          currency: defaultCurrency!.id,
          amount: event.amount,
          fee: event.fee,
          note: event.note,
          transactionDate: event.transactionDate,
        );

        emit(state.copyWith(savedTransfer: updatedTransfer));
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
