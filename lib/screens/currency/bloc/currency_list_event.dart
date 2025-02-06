part of 'currency_list_bloc.dart';

@freezed
class CurrencyListEvent with _$CurrencyListEvent {
  const factory CurrencyListEvent.started() = _Started;
}