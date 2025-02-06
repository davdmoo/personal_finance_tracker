import 'dart:async';

import 'package:drift/drift.dart' as drift;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../database.dart';
import '../../../../extensions/string.extensions.dart';

part 'category_form_bloc.freezed.dart';
part 'category_form_event.dart';
part 'category_form_state.dart';

class CategoryFormBloc extends Bloc<CategoryFormEvent, CategoryFormState> {
  final AppDatabase db;
  final int? categoryId;

  CategoryFormBloc({required this.db, this.categoryId}) : super(_CategoryFormState()) {
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
        final insertedData = await db.transaction<ExpenseCategory>(() async {
          // get the latest order from all accounts
          final selectStatement = (db.select(db.expenseCategories))
            ..orderBy([(t) => drift.OrderingTerm(expression: t.order, mode: drift.OrderingMode.desc)])
            ..limit(1);
          final result = await selectStatement.get();
          final highestOrderCategory = result.firstOrNull;

          final order = highestOrderCategory?.order ?? 0;
          final data = ExpenseCategoriesCompanion.insert(name: value.name.capitalized.trim(), order: order + 1);
          final newCategory = await db.into(db.expenseCategories).insertReturning(data);

          return newCategory;
        });

        emit(state.copyWith(expenseCategory: insertedData));
      } else {
        final data = ExpenseCategoriesCompanion(
          name: drift.Value(value.name.capitalized.trim()),
          description: drift.Value(value.description?.capitalized.trim()),
        );
        final query = db.update(db.expenseCategories)..where((tbl) => tbl.id.equals(categoryId));
        final result = await query.writeReturning(data);

        final updatedCategory = result.firstOrNull;
        if (updatedCategory == null) {
          throw Exception("Category is missing. It may have been deleted.");
        }

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
