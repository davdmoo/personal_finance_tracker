import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../logics/theme.logic.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final ThemeLogic themeLogic;

  AppBloc(this.themeLogic) : super(_AppState()) {
    on<AppEvent>(
      (events, emit) async {
        await events.map<FutureOr<void>>(
          started: (event) async => await _onStarted(event, emit),
          themeToggled: (event) async => await _onThemeToggled(event, emit),
        );
      },
    );
  }

  Future<void> _onStarted(_Started event, Emitter<AppState> emit) async {
    try {
      emit(state.copyWith(isLoading: true, error: null));

      final theme = await themeLogic.getTheme();
      emit(state.copyWith(theme: theme));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onThemeToggled(_ThemeToggled event, Emitter<AppState> emit) async {
    try {
      await themeLogic.setTheme(event.value);
      emit(state.copyWith(theme: event.value));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    }
  }
}
