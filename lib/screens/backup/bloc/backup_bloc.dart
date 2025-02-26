import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/app.constant.dart';
import '../../../logics/backup.logic.dart';

part 'backup_bloc.freezed.dart';
part 'backup_event.dart';
part 'backup_state.dart';

class BackupBloc extends Bloc<BackupEvent, BackupState> {
  final BackupLogic backupLogic;

  BackupBloc(this.backupLogic) : super(_BackupState()) {
    on<BackupEvent>(
      (events, emit) async {
        await events.map<FutureOr<void>>(
          started: (event) => _onStarted(event, emit),
          exportConfirmed: (event) async => await _onExportConfirmed(event, emit),
          importConfirmed: (event) async => await _onImportConfirmed(event, emit),
        );
      },
    );
  }

  Future<void> _onStarted(_Started event, Emitter<BackupState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final date = prefs.getString(AppConstant.lastBackupDatePrefsKey);

      emit(state.copyWith(lastBackupDate: date == null ? null : DateTime.parse(date)));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    }
  }

  Future<void> _onExportConfirmed(_ExportConfirmed event, Emitter<BackupState> emit) async {
    try {
      emit(state.copyWith(isExporting: true, error: null, exportSuccessful: false));
      await backupLogic.exportData(event.path);
      emit(state.copyWith(exportSuccessful: true));

      add(BackupEvent.started());
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isExporting: false));
    }
  }

  Future<void> _onImportConfirmed(_ImportConfirmed event, Emitter<BackupState> emit) async {
    try {
      emit(state.copyWith(isImporting: true, error: null, importSuccessful: false));
      await backupLogic.importData(event.file);
      emit(state.copyWith(importSuccessful: true));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isImporting: false));
    }
  }
}
