import '../database.dart';

class CategorizedExpense {
  final ExpenseCategory expenseCategory;
  final double totalAmount;

  const CategorizedExpense({required this.expenseCategory, required this.totalAmount});

  String getPercentage(double totalExpense) {
    final amount = totalAmount / totalExpense;
    return "${(double.parse(amount.toStringAsFixed(2)) * 100).toInt()}%";
  }
}
