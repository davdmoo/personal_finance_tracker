part of 'backup_bloc.dart';

@freezed
class BackupState with _$BackupState {
  const factory BackupState({
    @Default(false) bool isExporting,
    @Default(false) bool exportSuccessful,
    @Default(false) bool isImporting,
    @Default(false) bool importSuccessful,
    DateTime? lastBackupDate,
    Exception? error,
  }) = _BackupState;
}
