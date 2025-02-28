import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../database.dart';
import '../../../database_provider.dart';
import '../../../exceptions/notification_permission.exception.dart';
import '../../../logics/app_notification.logic.dart';
import '../../../logics/currency.logic.dart';
import '../../../logics/default_currency.logic.dart';

part 'splash_bloc.freezed.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppDatabase _db;
  final DatabaseProvider databaseProvider;

  final DefaultCurrencyLogic defaultCurrencyLogic;
  final CurrencyLogic currencyLogic;
  final AppNotification appNotificationLogic;

  SplashBloc({
    required this.databaseProvider,
    required this.defaultCurrencyLogic,
    required this.currencyLogic,
    required this.appNotificationLogic,
  })  : _db = databaseProvider.database,
        super(_SplashState()) {
    on<SplashEvent>(
      (events, emit) async {
        await events.map<FutureOr<void>>(
          started: (event) async => await _onStarted(event, emit),
          defaultCurrencySelected: (event) async => await _onDefaultCurrencySelected(event, emit),
        );
      },
    );
  }

  Future<void> _onStarted(_Started event, Emitter<SplashState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      await appNotificationLogic.init();
      await _db.populateDatabase();

      final defaultCurrency = await defaultCurrencyLogic.getDefaultCurrency();
      if (defaultCurrency == null) {
        final currencies = await currencyLogic.findAll();
        emit(state.copyWith(currencies: currencies));
      } else {
        emit(state.copyWith(appInitSuccessful: true));
      }
    } on NotificationPermissionException catch (err) {
      emit(state.copyWith(error: err));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onDefaultCurrencySelected(_DefaultCurrencySelected event, Emitter<SplashState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      await defaultCurrencyLogic.setDefaultCurrency(event.currency);
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
