import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../extensions/date_time.extensions.dart';
import '../../logics/backup.logic.dart';
import '../../widgets/loading.widget.dart';
import 'bloc/backup_bloc.dart';

class BackupScreen extends StatelessWidget {
  const BackupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BackupBloc(context.read<BackupLogic>())..add(BackupEvent.started()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<BackupBloc, BackupState>(
            listenWhen: (previous, current) => previous.exportSuccessful != current.exportSuccessful,
            listener: (context, state) async {
              final isExportSuccessful = state.exportSuccessful;
              if (!isExportSuccessful) return;

              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Backup complete!"),
                  actions: [
                    TextButton(onPressed: () => context.pop(), child: Text("Close")),
                  ],
                ),
              );
            },
          ),
          BlocListener<BackupBloc, BackupState>(
            listenWhen: (previous, current) => previous.importSuccessful != current.importSuccessful,
            listener: (context, state) async {
              final isImportSuccessful = state.importSuccessful;
              if (!isImportSuccessful) return;

              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Import complete!"),
                  actions: [
                    TextButton(onPressed: () => context.pop(), child: Text("Close")),
                  ],
                ),
              );
            },
          ),
          BlocListener<BackupBloc, BackupState>(
            listenWhen: (previous, current) => previous.error != current.error && current.error != null,
            listener: (context, state) {
              final error = state.error;

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error.toString()),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              );
            },
          ),
        ],
        child: BlocBuilder<BackupBloc, BackupState>(
          buildWhen: (previous, current) {
            return previous.isExporting != current.isExporting || previous.isImporting != current.isImporting;
          },
          builder: (context, state) {
            final isImporting = state.isImporting;
            final isExporting = state.isExporting;

            return Stack(
              children: [
                Scaffold(
                  appBar: AppBar(title: Text("Backup & Exports")),
                  body: ListView(
                    children: [
                      BlocBuilder<BackupBloc, BackupState>(
                        buildWhen: (previous, current) => previous.lastBackupDate != current.lastBackupDate,
                        builder: (context, state) {
                          final lastBackupDate = state.lastBackupDate;

                          return ListTile(
                            title: Text("Last backup: ${lastBackupDate?.dateLocaleId ?? '-'}"),
                            onTap: () async {
                              final directory = await FilePicker.platform.getDirectoryPath();
                              if (directory == null || !context.mounted) return;

                              context.read<BackupBloc>().add(BackupEvent.exportConfirmed(directory));
                            },
                          );
                        },
                      ),
                      ListTile(
                        title: Text("Import data from a backup file"),
                        onTap: () async {
                          final isConfirmed = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Your current data will be replaced. Is that okay?"),
                              actions: [
                                TextButton(onPressed: () => context.pop(false), child: Text("Cancel")),
                                TextButton(onPressed: () => context.pop(true), child: Text("Confirm")),
                              ],
                            ),
                          );
                          if (isConfirmed == null || !isConfirmed) return;

                          final pickedFile = await FilePicker.platform.pickFiles(allowMultiple: false);
                          if (pickedFile == null || !context.mounted) return;

                          final file = pickedFile.files.firstOrNull;
                          if (file == null) return;

                          context.read<BackupBloc>().add(BackupEvent.importConfirmed(File(file.path!)));
                        },
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: isImporting,
                  child: LoadingWidget(loadingMessage: "Importing data..\nThis might take a few minutes"),
                ),
                Visibility(
                  visible: isExporting,
                  child: LoadingWidget(loadingMessage: "Backing up data..\nThis might take a few minutes"),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
