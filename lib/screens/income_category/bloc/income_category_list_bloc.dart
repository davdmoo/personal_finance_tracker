import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../database.dart';
import '../../../logics/income_category.logic.dart';

part 'income_category_list_bloc.freezed.dart';
part 'income_category_list_event.dart';
part 'income_category_list_state.dart';

class IncomeCategoryListBloc extends Bloc<IncomeCategoryListEvent, IncomeCategoryListState> {
  final IncomeCategoryLogic incomeCategoryLogic;

  IncomeCategoryListBloc(this.incomeCategoryLogic) : super(_IncomeCategoryListState()) {
    on<IncomeCategoryListEvent>((events, emit) async {
      await events.map<FutureOr<void>>(
        started: (value) async => await _onStarted(value, emit),
        reordered: (event) async => await _onReordered(event, emit),
      );
    });
  }

  Future<void> _onStarted(_Started value, Emitter<IncomeCategoryListState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final incomeCategories = await incomeCategoryLogic.findAll();

      emit(state.copyWith(incomeCategories: incomeCategories));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onReordered(_Reordered event, Emitter<IncomeCategoryListState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final oldIndex = event.oldIndex;
      int newIndex = event.newIndex;
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }

      final categories = [...state.incomeCategories];
      final movedCategory = categories.removeAt(oldIndex);
      categories.insert(newIndex, movedCategory);
      emit(state.copyWith(incomeCategories: categories)); // emit for local state so the list doesnt "flicker"

      final incomeCategories = await incomeCategoryLogic.reorder(categories);

      emit(state.copyWith(incomeCategories: incomeCategories));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
