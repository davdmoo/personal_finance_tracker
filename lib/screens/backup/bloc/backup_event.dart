part of 'backup_bloc.dart';

@freezed
class BackupEvent with _$BackupEvent {
  const factory BackupEvent.started() = _Started;
  const factory BackupEvent.exportConfirmed(String path) = _ExportConfirmed;
  const factory BackupEvent.importConfirmed(File file) = _ImportConfirmed;
}
