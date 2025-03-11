part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(false) bool isLoading,
    @Default(ThemeMode.system) ThemeMode theme,
    Exception? error,
  }) = _AppState;
}
