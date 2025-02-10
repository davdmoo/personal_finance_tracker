import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../database.dart';
import '../../../../logics/budget.logic.dart';
import '../../../../logics/expense_category.logic.dart';

part 'budget_form_bloc.freezed.dart';
part 'budget_form_event.dart';
part 'budget_form_state.dart';

class BudgetFormBloc extends Bloc<BudgetFormEvent, BudgetFormState> {
  final Budget? budget;

  final BudgetLogic budgetLogic;
  final ExpenseCategoryLogic expenseCategoryLogic;

  BudgetFormBloc({
    this.budget,
    required this.budgetLogic,
    required this.expenseCategoryLogic,
  }) : super(_BudgetFormState()) {
    on<BudgetFormEvent>((events, emit) async {
      await events.map<FutureOr<void>>(
        started: (event) async => await _onStarted(event, emit),
        formSubmitted: (event) async => await _onFormSubmitted(event, emit),
      );
    });
  }

  Future<void> _onStarted(_Started event, Emitter<BudgetFormState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final expenseCategories = await expenseCategoryLogic.findAll();

      emit(state.copyWith(expenseCategories: expenseCategories));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onFormSubmitted(_FormSubmitted event, Emitter<BudgetFormState> emit) async {
    try {
      emit(state.copyWith(isSaving: true));

      final budget = this.budget;
      if (budget == null) {
        final newBudget = await budgetLogic.create(
          categoryId: event.category.id,
          amount: event.amount,
        );

        emit(state.copyWith(savedBudget: newBudget));
      } else {
        final updatedBudget = await budgetLogic.update(
          id: budget.id,
          categoryId: event.category.id,
          amount: event.amount,
        );

        emit(state.copyWith(savedBudget: updatedBudget));
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
