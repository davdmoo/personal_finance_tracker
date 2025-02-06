import 'dart:async';

import 'package:drift/drift.dart' as drift;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../database.dart';

part 'category_list_bloc.freezed.dart';
part 'category_list_event.dart';
part 'category_list_state.dart';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  final AppDatabase db;

  CategoryListBloc({required this.db}) : super(_CategoryListState()) {
    on<CategoryListEvent>((events, emit) async {
      await events.map<FutureOr<void>>(
        started: (value) async => await _onStarted(value, emit),
      );
    });
  }

  Future<void> _onStarted(_Started value, Emitter<CategoryListState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final selectStatement = db.select(db.expenseCategories)..orderBy([(t) => drift.OrderingTerm.asc(t.order)]);
      final categories = await selectStatement.get();

      emit(state.copyWith(categories: categories));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
