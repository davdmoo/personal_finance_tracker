part of 'splash_bloc.dart';

@freezed
class SplashEvent with _$SplashEvent {
  const factory SplashEvent.started() = _Started;
  const factory SplashEvent.defaultCurrencySelected(Currency currency) = _DefaultCurrencySelected;
}
