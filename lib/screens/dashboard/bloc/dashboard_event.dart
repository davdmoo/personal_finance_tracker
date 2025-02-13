part of 'dashboard_bloc.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.started() = _Started;
  const factory DashboardEvent.timeRangeChanged(TimeRange value) = _TimeRangeChanged;
  const factory DashboardEvent.customDateRangeSelected(DateTimeRange value) = _CustomDateRangeSelected;
}
