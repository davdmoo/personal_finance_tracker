import 'database.dart';

class DatabaseProvider {
  AppDatabase _db = AppDatabase();

  DatabaseProvider();

  AppDatabase get database => _db;
  void updateDatabase() {
    _db = AppDatabase();
  }
}
