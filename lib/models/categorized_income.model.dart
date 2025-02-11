import '../database.dart';

class CategorizedIncome {
  final IncomeCategory incomeCategory;
  final double totalAmount;

  const CategorizedIncome({required this.incomeCategory, required this.totalAmount});

  double getPercentage(double totalIncome) {
    return (totalAmount / totalIncome);
  }
}
