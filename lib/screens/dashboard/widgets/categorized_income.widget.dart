import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/dashboard_bloc.dart';

class CategorizedIncomeWidget extends StatelessWidget {
  const CategorizedIncomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (previous, current) => previous.categorizedIncomes != current.categorizedIncomes,
      builder: (context, state) {
        final categorizedIncomes = state.categorizedIncomes;

        return ListView.builder(
          itemCount: categorizedIncomes.length,
          itemBuilder: (context, index) {
            final item = categorizedIncomes[index];

            return ListTile(
              title: Text(item.incomeCategory.name),
              leading: Text(item.getPercentage(state.totalIncome).toString()),
              trailing: Text(item.totalAmount.toString()),
            );
          },
        );
      },
    );
  }
}
