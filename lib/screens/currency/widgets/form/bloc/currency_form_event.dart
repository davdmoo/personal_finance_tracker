part of 'currency_form_bloc.dart';

@freezed
class CurrencyFormEvent with _$CurrencyFormEvent {
  const factory CurrencyFormEvent.started() = _Started;
  const factory CurrencyFormEvent.formSubmitted({
    required String name,
    required String code,
  }) = _FormSubmitted;
}
