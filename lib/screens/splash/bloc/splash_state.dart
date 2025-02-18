part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    @Default(false) bool appInitSuccessful,
    @Default(false) bool isLoading,
    @Default([]) List<Currency> currencies,
    Exception? error,
  }) = _SplashState;
}
