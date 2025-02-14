import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../enums/time_range.enum.dart';
import '../../../logics/expense.logic.dart';
import '../../../logics/income.logic.dart';
import '../../../models/categorized_expense.model.dart';

part 'summary_bloc.freezed.dart';
part 'summary_event.dart';
part 'summary_state.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  final ExpenseLogic expenseLogic;
  final IncomeLogic incomeLogic;

  SummaryBloc({
    required this.expenseLogic,
    required this.incomeLogic,
  }) : super(_SummaryState()) {
    on<SummaryEvent>((events, emit) async {
      await events.map<FutureOr<void>>(
        started: (event) async => await _onStarted(event, emit),
        timeRangeChanged: (event) => _onTimeRangeChanged(event, emit),
        customDateRangeSelected: (event) => _onCustomDateRangeSelected(event, emit),
        downloadExcelTriggered: (event) async => await _onDownloadExcelTriggered(event, emit),
      );
    });
  }

  Future<void> _onStarted(_Started event, Emitter<SummaryState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      if (state.timeRange != TimeRange.custom) {
        emit(state.copyWith(dateTimeRange: state.timeRange.dateRange));
      }

      final dateTimeRange = state.dateTimeRange ?? state.timeRange.dateRange;
      final totalExpense = await expenseLogic.findTotalExpense(dateTimeRange);
      emit(state.copyWith(totalExpense: totalExpense));

      final totalIncome = await incomeLogic.findTotalIncome(dateTimeRange);
      emit(state.copyWith(totalIncome: totalIncome));

      final topSpendings = await expenseLogic.findCategorizedExpenses(dateRange: dateTimeRange, limit: 3);
      emit(state.copyWith(topSpendingsByCategory: topSpendings));
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onTimeRangeChanged(_TimeRangeChanged event, Emitter<SummaryState> emit) {
    emit(state.copyWith(timeRange: event.value));
    add(SummaryEvent.started());
  }

  void _onCustomDateRangeSelected(_CustomDateRangeSelected event, Emitter<SummaryState> emit) {
    emit(state.copyWith(dateTimeRange: event.value, timeRange: TimeRange.custom));
    add(SummaryEvent.started());
  }

  Future<void> _onDownloadExcelTriggered(_DownloadExcelTriggered event, Emitter<SummaryState> emit) async {
    try {
      emit(state.copyWith(isDownloading: true));

      // request for permission for reading and writing to file storage
      late final Permission permission;

      // Use correct permission based on Android version
      if (await Permission.manageExternalStorage.isGranted) {
        permission = Permission.manageExternalStorage;
      } else if (await Permission.storage.isGranted) {
        permission = Permission.storage;
      } else {
        permission = Permission.mediaLibrary; // Android 13+
      }

      final status = await permission.request();
      if (!status.isGranted || status.isDenied) {
        throw Exception("We need file storage permission to save the report.");
      }

      final timeRange = event.timeRange;
      final dateRange = event.dateRange;
      if (timeRange == TimeRange.custom && dateRange == null) {
        throw Exception("Date range must be present if you picked custom time range.");
      }

      final expenses = await expenseLogic.findAll(dateRange: dateRange ?? timeRange.dateRange);

      final excel = Excel.createExcel();
      excel.rename("Sheet1", "Report");

      Sheet sheetObject = excel["Report"];
      final cell = sheetObject.cell(CellIndex.indexByString("A1"));
      cell.value = TextCellValue("Testing 123");

      final fileBytes = excel.save();
      if (fileBytes == null) throw Exception("Failed while saving excel file. Please try again.");

      Directory? dir = await getDownloadsDirectory();
      if (dir == null) throw Exception("Failed getting downloads directory. Please try again.");

      if (Platform.isAndroid) {
        dir = Directory("/storage/emulated/0/Download");
      }

      final file = File("${dir.path}/report.xlsx");
      file.createSync(recursive: true);

      await file.writeAsBytes(fileBytes);
      log("Successfully downloaded.");
    } catch (err) {
      log(err.toString());
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isDownloading: false));
    }
  }
}
