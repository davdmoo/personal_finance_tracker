import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../database.dart';
import '../../../../logics/expense_category.logic.dart';

part 'category_form_bloc.freezed.dart';
part 'category_form_event.dart';
part 'category_form_state.dart';

class CategoryFormBloc extends Bloc<CategoryFormEvent, CategoryFormState> {
  final ExpenseCategoryLogic expenseCategoryLogic;
  final int? categoryId;

  CategoryFormBloc({required this.expenseCategoryLogic, this.categoryId}) : super(_CategoryFormState()) {
    on<CategoryFormEvent>(
      (events, emit) async {
        await events.map<FutureOr<void>>(
          started: (value) => _onStarted(value, emit),
          formSubmitted: (value) async => await _onFormSubmitted(value, emit),
        );
      },
    );
  }

  void _onStarted(_Started value, Emitter<CategoryFormState> emit) {}

  Future<void> _onFormSubmitted(_FormSubmitted value, Emitter<CategoryFormState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final categoryId = this.categoryId;
      if (categoryId == null) {
        final newExpenseCategory = await expenseCategoryLogic.create(name: value.name, description: value.description);

        emit(state.copyWith(expenseCategory: newExpenseCategory));
      } else {
        final updatedCategory = await expenseCategoryLogic.update(
          id: categoryId,
          name: value.name,
          description: value.description,
        );

        emit(state.copyWith(expenseCategory: updatedCategory));
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
