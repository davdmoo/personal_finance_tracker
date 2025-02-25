import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../extensions/date_time.extensions.dart';
import '../../logics/backup.logic.dart';
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
        child: Scaffold(
          appBar: AppBar(title: Text("Backup & Exports")),
          body: Builder(
            builder: (context) => ListView(
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
        ),
      ),
    );
  }
}
