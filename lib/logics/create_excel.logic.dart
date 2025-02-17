import 'dart:io';

import 'package:excel/excel.dart' as x;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../extensions/date_time.extensions.dart';
import '../extensions/date_time_range.extension.dart';
import 'expense.logic.dart';
import 'income.logic.dart';
import 'transfer.logic.dart';

class CreateExcelLogic {
  final ExpenseLogic expenseLogic;
  final IncomeLogic incomeLogic;
  final TransferLogic transferLogic;

  const CreateExcelLogic({
    required this.expenseLogic,
    required this.incomeLogic,
    required this.transferLogic,
  });

  Future<File> call(DateTimeRange dateRange) async {
    final excel = x.Excel.createExcel();

    // EXPENSE sheet
    excel.rename("Sheet1", "Expenses");
    x.Sheet expenseSheet = excel["Expenses"];

    final headerRow = [
      x.TextCellValue("Tx Date"),
      x.TextCellValue("Amount"),
      x.TextCellValue("Note"),
      x.TextCellValue("Account"),
      x.TextCellValue("Category")
    ];
    expenseSheet.appendRow(headerRow);

    final expenses = await expenseLogic.findAll(dateRange: dateRange);
    for (final el in expenses) {
      final expense = el.expense;

      expenseSheet.appendRow(
        [
          x.TextCellValue(expense.transactionDate.dateTimeLocaleId),
          x.DoubleCellValue(expense.amount),
          x.TextCellValue(expense.note),
          x.TextCellValue(el.account?.name ?? "-"),
          x.TextCellValue(el.category?.name ?? "-")
        ],
      );
    }

    // INCOME sheet
    x.Sheet incomeSheet = excel["Incomes"];
    incomeSheet.appendRow(headerRow);

    final incomes = await incomeLogic.findAll(dateRange: dateRange);
    for (final el in incomes) {
      final income = el.income;

      incomeSheet.appendRow(
        [
          x.TextCellValue(income.transactionDate.dateTimeLocaleId),
          x.DoubleCellValue(income.amount),
          x.TextCellValue(income.note),
          x.TextCellValue(el.account?.name ?? "-"),
          x.TextCellValue(el.category?.name ?? "-")
        ],
      );
    }

    excel.link("Incomes", incomeSheet);

    // TRANSFERS sheet
    x.Sheet transferSheet = excel["Transfers"];
    transferSheet.appendRow([
      x.TextCellValue("Tx Date"),
      x.TextCellValue("Amount"),
      x.TextCellValue("Fee"),
      x.TextCellValue("Note"),
      x.TextCellValue("Account Origin"),
      x.TextCellValue("Account Destination")
    ]);

    final transfers = await transferLogic.findAll();
    for (final el in transfers) {
      final transfer = el.transfer;

      transferSheet.appendRow(
        [
          x.TextCellValue(transfer.transactionDate.dateLocaleId),
          x.DoubleCellValue(transfer.amount),
          x.DoubleCellValue(transfer.fee),
          x.TextCellValue(transfer.note),
          x.TextCellValue(el.accountOrigin?.name ?? "-"),
          x.TextCellValue(el.accountDestination?.name ?? "-")
        ],
      );
    }

    excel.link("Transfers", transferSheet);

    final fileBytes = excel.save();
    if (fileBytes == null) throw Exception("Failed while saving excel file. Please try again.");

    Directory? dir = await getDownloadsDirectory();
    if (dir == null) throw Exception("Failed getting downloads directory. Please try again.");

    if (Platform.isAndroid) {
      dir = Directory("/storage/emulated/0/Download");
    }

    String fileName = dateRange.excelReportFileName;
    File file = File("${dir.path}/$fileName.xlsx");

    int i = 0;
    while (file.existsSync()) {
      i++;
      file = File("${dir.path}/$fileName($i).xlsx");
    }

    file.createSync(recursive: true);

    return await file.writeAsBytes(fileBytes);
  }
}
