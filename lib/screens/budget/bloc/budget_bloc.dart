import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../database.dart';
import '../../../logics/budget.logic.dart';

part 'budget_bloc.freezed.dart';
part 'budget_event.dart';
part 'budget_state.dart';

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  final BudgetLogic budgetLogic;

  BudgetBloc(this.budgetLogic) : super(_BudgetState()) {
    on<BudgetEvent>((events, emit) async {
      await events.map<FutureOr<void>>(
        started: (event) async => await _onStarted(event, emit),
      );
    });
  }

  Future<void> _onStarted(_Started event, Emitter<BudgetState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final budgets = await budgetLogic.findAll();

      emit(state.copyWith(budgets: budgets));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
