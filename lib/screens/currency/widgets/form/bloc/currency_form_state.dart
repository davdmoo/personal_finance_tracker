part of 'currency_form_bloc.dart';

@freezed
class CurrencyFormState with _$CurrencyFormState {
  const factory CurrencyFormState({
    Currency? savedCurrency,
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    Exception? error,
  }) = _CurrencyFormState;
}
