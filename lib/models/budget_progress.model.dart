import '../database.dart';

class BudgetProgress {
  final PopulatedBudget budget;
  final double usedAmount;

  const BudgetProgress({required this.budget, required this.usedAmount});
}
