import '../database.dart';

class CategorizedIncome {
  final IncomeCategory incomeCategory;
  final double totalAmount;

  const CategorizedIncome({required this.incomeCategory, required this.totalAmount});

  String getPercentage(double totalIncome) {
    return "${(double.parse((totalAmount / totalIncome).toStringAsFixed(2)) * 100).toInt()}%";
  }
}
