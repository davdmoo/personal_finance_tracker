import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../database.dart';
import '../../../logics/expense_category.logic.dart';

part 'expense_category_list_bloc.freezed.dart';
part 'expense_category_list_event.dart';
part 'expense_category_list_state.dart';

class ExpenseCategoryListBloc extends Bloc<ExpenseCategoryListEvent, ExpenseCategoryListState> {
  final ExpenseCategoryLogic expenseCategoryLogic;

  ExpenseCategoryListBloc(this.expenseCategoryLogic) : super(_ExpenseCategoryListState()) {
    on<ExpenseCategoryListEvent>((events, emit) async {
      await events.map<FutureOr<void>>(
        started: (value) async => await _onStarted(value, emit),
        reordered: (event) async => await _onReordered(event, emit),
      );
    });
  }

  Future<void> _onStarted(_Started value, Emitter<ExpenseCategoryListState> emit) async {
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

  Future<void> _onReordered(_Reordered event, Emitter<ExpenseCategoryListState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final oldIndex = event.oldIndex;
      int newIndex = event.newIndex;
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }

      final categories = [...state.expenseCategories];
      final movedCategory = categories.removeAt(oldIndex);
      categories.insert(newIndex, movedCategory);
      emit(state.copyWith(expenseCategories: categories)); // emit for local state so the list doesnt "flicker"

      final expenseCategories = await expenseCategoryLogic.reorder(categories);

      emit(state.copyWith(expenseCategories: expenseCategories));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
