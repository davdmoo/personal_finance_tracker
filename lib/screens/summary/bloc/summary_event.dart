part of 'summary_bloc.dart';

@freezed
class SummaryEvent with _$SummaryEvent {
  const factory SummaryEvent.started() = _Started;
  const factory SummaryEvent.timeRangeChanged(TimeRange value) = _TimeRangeChanged;
  const factory SummaryEvent.customDateRangeSelected(DateTimeRange value) = _CustomDateRangeSelected;
  const factory SummaryEvent.downloadExcelTriggered({
    required TimeRange timeRange,
    DateTimeRange? dateRange,
  }) = _DownloadExcelTriggered;
}
