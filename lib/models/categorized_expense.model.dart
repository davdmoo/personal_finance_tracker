import '../database.dart';

class CategorizedExpense {
  final ExpenseCategory expenseCategory;
  final double totalAmount;

  const CategorizedExpense({required this.expenseCategory, required this.totalAmount});

  double getPercentage(double totalExpense) {
    final amount = totalAmount / totalExpense;
    return double.parse(amount.toStringAsFixed(2));
  }
}
