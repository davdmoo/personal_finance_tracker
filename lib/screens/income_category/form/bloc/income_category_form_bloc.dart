import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../database.dart';
import '../../../../logics/income_category.logic.dart';

part 'income_category_form_bloc.freezed.dart';
part 'income_category_form_event.dart';
part 'income_category_form_state.dart';

class IncomeCategoryFormBloc extends Bloc<IncomeCategoryFormEvent, IncomeCategoryFormState> {
  final IncomeCategory? categoryToUpdate;
  final IncomeCategoryLogic incomeCategoryLogic;

  IncomeCategoryFormBloc({
    required this.incomeCategoryLogic,
    this.categoryToUpdate,
  }) : super(_IncomeCategoryFormState()) {
    on<IncomeCategoryFormEvent>((events, emit) async {
      await events.map<FutureOr<void>>(
        started: (value) => _onStarted(value, emit),
        formSubmitted: (value) async => await _onFormSubmitted(value, emit),
      );
    });
  }

  void _onStarted(value, Emitter<IncomeCategoryFormState> emit) {}

  Future<void> _onFormSubmitted(_FormSubmitted value, Emitter<IncomeCategoryFormState> emit) async {
    try {
      emit(state.copyWith(isSaving: true));

      final categoryId = categoryToUpdate?.id;
      if (categoryId == null) {
        final newIncomeCategory = await incomeCategoryLogic.create(name: value.name, description: value.description);

        emit(state.copyWith(incomeCategory: newIncomeCategory));
      } else {
        final updatedCategory = await incomeCategoryLogic.update(
          id: categoryId,
          name: value.name,
          description: value.description,
        );

        emit(state.copyWith(incomeCategory: updatedCategory));
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
