import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../database.dart';

part 'splash_bloc.freezed.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppDatabase db;

  SplashBloc(this.db) : super(_SplashState()) {
    on<SplashEvent>(
      (events, emit) async {
        await events.map<FutureOr<void>>(
          started: (event) async => await _onStarted(event, emit),
        );
      },
    );
  }

  Future<void> _onStarted(_Started event, Emitter<SplashState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      await Future.delayed(Duration(seconds: 2));
      await db.populateDatabase();
      emit(state.copyWith(appInitSuccessful: true));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
