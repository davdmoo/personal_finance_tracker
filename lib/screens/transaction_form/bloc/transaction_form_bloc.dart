import 'dart:async';

import 'package:drift/drift.dart' as drift;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../database.dart';

part 'transaction_form_bloc.freezed.dart';
part 'transaction_form_event.dart';
part 'transaction_form_state.dart';

class TransactionFormBloc extends Bloc<TransactionFormEvent, TransactionFormState> {
  final AppDatabase db;

  final PopulatedExpense? populatedExpense;
  final PopulatedIncome? populatedIncome;
  final PopulatedTransfer? populatedTransfer;

  TransactionFormBloc({
    required this.db,
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

      final selectAccountStatement = (db.select(db.accounts))..orderBy([(t) => drift.OrderingTerm.asc(t.order)]);
      final accounts = await selectAccountStatement.get();
      emit(state.copyWith(accounts: accounts));

      final selectExpenseCatStatement = (db.select(db.expenseCategories))
        ..orderBy([(t) => drift.OrderingTerm.asc(t.order)]);
      final expenseCats = await selectExpenseCatStatement.get();
      emit(state.copyWith(expenseCategories: expenseCats));

      final selectIncomeCatStatement = (db.select(db.incomeCategories))
        ..orderBy([(t) => drift.OrderingTerm.asc(t.order)]);
      final incomeCats = await selectIncomeCatStatement.get();
      emit(state.copyWith(incomeCategories: incomeCats));

      final currencies = await db.select(db.currencies).get();
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

      final populatedExpense = this.populatedExpense;
      if (populatedExpense == null) {
        final data = ExpensesCompanion.insert(
          categoryId: event.category.id,
          accountId: event.account.id,
          currencyId: event.currency.id,
          amount: event.amount,
          note: event.note ?? "",
          transactionDate: event.transactionDate,
        );
        final newExpense = await db.into(db.expenses).insertReturning(data);

        emit(state.copyWith(savedExpense: newExpense));
      } else {
        final data = ExpensesCompanion(
          categoryId: drift.Value(event.category.id),
          accountId: drift.Value(event.account.id),
          currencyId: drift.Value(event.currency.id),
          amount: drift.Value(event.amount),
          note: drift.Value(event.note ?? ""),
          transactionDate: drift.Value(event.transactionDate),
        );
        final query = db.update(db.expenses)..where((tbl) => tbl.id.equals(populatedExpense.expense.id));
        final result = await query.writeReturning(data);

        final updatedExpense = result.firstOrNull;
        if (updatedExpense == null) {
          throw Exception("Expense is missing. It may have been deleted.");
        }

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

      final populatedIncome = this.populatedIncome;
      if (populatedIncome == null) {
        final data = IncomesCompanion.insert(
          categoryId: event.category.id,
          accountId: event.account.id,
          currencyId: event.currency.id,
          amount: event.amount,
          note: event.note ?? "",
          transactionDate: event.transactionDate,
        );
        final newIncome = await db.into(db.incomes).insertReturning(data);

        emit(state.copyWith(savedIncome: newIncome));
      } else {
        final data = IncomesCompanion(
          categoryId: drift.Value(event.category.id),
          accountId: drift.Value(event.account.id),
          currencyId: drift.Value(event.currency.id),
          amount: drift.Value(event.amount),
          note: drift.Value(event.note ?? ""),
          transactionDate: drift.Value(event.transactionDate),
        );
        final query = db.update(db.incomes)..where((tbl) => tbl.id.equals(populatedIncome.income.id));
        final result = await query.writeReturning(data);

        final updatedIncome = result.firstOrNull;
        if (updatedIncome == null) {
          throw Exception("Income is missing. It may have been deleted.");
        }

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

      final populatedTransfer = this.populatedTransfer;
      if (populatedTransfer == null) {
        final data = TransfersCompanion.insert(
          accountOrigin: event.accountOrigin.id,
          accountDestination: event.accountDestination.id,
          currencyId: event.currency.id,
          amount: event.amount,
          fee: drift.Value(event.fee),
          note: event.note ?? "",
          transactionDate: event.transactionDate,
        );
        final newTransfer = await db.into(db.transfers).insertReturning(data);

        emit(state.copyWith(savedTransfer: newTransfer));
      } else {
        final data = TransfersCompanion(
          accountOrigin: drift.Value(event.accountOrigin.id),
          accountDestination: drift.Value(event.accountDestination.id),
          currencyId: drift.Value(event.currency.id),
          amount: drift.Value(event.amount),
          fee: drift.Value(event.fee),
          note: drift.Value(event.note ?? ""),
          transactionDate: drift.Value(event.transactionDate),
        );
        final query = db.update(db.transfers)..where((tbl) => tbl.id.equals(populatedTransfer.transfer.id));
        final result = await query.writeReturning(data);

        final updatedTransfer = result.firstOrNull;
        if (updatedTransfer == null) {
          throw Exception("Transfer is missing. It may have been deleted.");
        }

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
