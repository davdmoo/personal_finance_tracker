import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:open_file_manager/open_file_manager.dart';

import '../../logics/app_notification.logic.dart';
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
        appNotificationLogic: context.read<AppNotification>(),
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
            listener: (context, state) async {
              final file = state.excelReport;
              if (file == null) return;

              // in case user haven't allowed app notifications
              final result = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Export to excel successful!"),
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(false),
                      child: Text("Close"),
                    ),
                    TextButton(
                      onPressed: () => context.pop(true),
                      child: Text("Open folder"),
                    )
                  ],
                ),
              );
              if (result == null || !result || !context.mounted) return;

              openFileManager(androidConfig: AndroidConfig(folderType: FolderType.download));
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
                  ExportExcelButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
