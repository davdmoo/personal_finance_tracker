import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_filex/open_filex.dart';

import '../../logics/create_excel.logic.dart';
import '../../logics/expense.logic.dart';
import '../../logics/income.logic.dart';
import 'bloc/summary_bloc.dart';
import 'widgets/export_excel_button.widget.dart';
import 'widgets/summary.widget.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SummaryBloc(
        expenseLogic: context.read<ExpenseLogic>(),
        incomeLogic: context.read<IncomeLogic>(),
        createExcelLogic: context.read<CreateExcelLogic>(),
      )..add(SummaryEvent.started()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<SummaryBloc, SummaryState>(
            listenWhen: (previous, current) => previous.error != current.error && current.error != null,
            listener: (context, state) {
              final error = state.error;
              if (error == null) return;

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error.toString()),
                  backgroundColor: Theme.of(context).colorScheme.error,
                  showCloseIcon: true,
                  closeIconColor: Theme.of(context).colorScheme.errorContainer,
                ),
              );
            },
          ),
          BlocListener<SummaryBloc, SummaryState>(
            listenWhen: (previous, current) {
              return previous.excelReport != current.excelReport && current.excelReport != null;
            },
            listener: (context, state) {
              final file = state.excelReport;
              if (file == null) return;

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Download successful. Please check your downloads folder."),
                  action: SnackBarAction(label: "Open", onPressed: () => OpenFilex.open(file.path)),
                ),
              );
            },
          ),
        ],
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                spacing: 16,
                children: [
                  SummaryWidget(),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      ExportExcelButton(),
                      Tooltip(
                        message: "Check your downloads folder",
                        child: Icon(Icons.info_outline, size: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
