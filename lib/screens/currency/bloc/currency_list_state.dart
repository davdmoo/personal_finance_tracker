part of 'currency_list_bloc.dart';

@freezed
class CurrencyListState with _$CurrencyListState {
  const factory CurrencyListState({
    @Default([]) List<Currency> currencies,
    @Default(false) bool isLoading,
    Exception? error,
  }) = _CurrencyListState;
}
