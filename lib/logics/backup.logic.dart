import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqlite3/sqlite3.dart';

import '../constants/app.constant.dart';
import '../database_provider.dart';

class BackupLogic {
  final DatabaseProvider databaseProvider;

  BackupLogic(this.databaseProvider);

  Future<String> exportData(String directory) async {
    final now = DateTime.now();

    final name = "${now.day}_${now.month}_${now.year}_${AppConstant.backupDatabaseName}.sqlite";
    final filePath = "$directory/$name";
    final file = File(filePath);

    final isFileExist = await file.exists();
    if (isFileExist) {
      await file.delete();
    }

    final db = databaseProvider.database;
    await db.customStatement("VACUUM INTO ?", [filePath]);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstant.lastBackupDatePrefsKey, now.toIso8601String());

    return filePath;
  }

  Future<void> importData(File file) async {
    final appDir = await getApplicationDocumentsDirectory();
    final path = p.join(appDir.path, "${AppConstant.databaseName}.sqlite");

    final db = databaseProvider.database;
    await db.close();

    // open the selected database file
    final backupDb = sqlite3.open(file.path);

    // vacuum it into a temporary location first to make sure it's working
    final tempDir = await getTemporaryDirectory();
    final tempDb = p.join(tempDir.path, "import.db");
    final tempDbFile = File(tempDb);
    if (await tempDbFile.exists()) {
      await tempDbFile.delete();
    }

    backupDb
      ..execute("VACUUM INTO ?", [tempDb])
      ..dispose();

    // then replace the existing database file with it
    await tempDbFile.copy(path);
    await tempDbFile.delete();

    // re-init the database
    databaseProvider.updateDatabase();
  }
}
