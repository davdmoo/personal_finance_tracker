import '../database.dart';

class IncomeCategoryLogic {
  final AppDatabase db;
  const IncomeCategoryLogic(this.db);

  Future<List<IncomeCategory>> findAll() async {
    return await db.select(db.incomeCategories).get();
  }
}
