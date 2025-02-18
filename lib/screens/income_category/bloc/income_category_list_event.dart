part of 'income_category_list_bloc.dart';

@freezed
class IncomeCategoryListEvent with _$IncomeCategoryListEvent {
  const factory IncomeCategoryListEvent.started() = _Started;
  const factory IncomeCategoryListEvent.reordered({
    required int oldIndex,
    required int newIndex,
  }) = _Reordered;
}
