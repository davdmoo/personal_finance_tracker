import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../database.dart';
import '../../logics/expense_category.logic.dart';
import 'bloc/expense_category_list_bloc.dart';
import 'form/category_form.widget.dart';

class ExpenseCategoryScreen extends StatelessWidget {
  const ExpenseCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpenseCategoryListBloc(
        context.read<ExpenseCategoryLogic>(),
      )..add(ExpenseCategoryListEvent.started()),
      child: BlocListener<ExpenseCategoryListBloc, ExpenseCategoryListState>(
        listenWhen: (previous, current) => previous.error != current.error && current.error != null,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.toString()),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        },
        child: Scaffold(
          appBar: AppBar(title: Text("Categories")),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: BlocBuilder<ExpenseCategoryListBloc, ExpenseCategoryListState>(
              buildWhen: (previous, current) => previous.expenseCategories != current.expenseCategories,
              builder: (context, state) {
                final categories = state.expenseCategories;

                return ReorderableListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];

                    return ListTile(
                      key: Key(category.id.toString()),
                      title: Text(category.name),
                      subtitle: Text(category.description ?? ""),
                      onTap: () async {
                        final response = await showDialog<ExpenseCategory>(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => CategoryFormDialog(categoryToUpdate: category),
                        );
                        if (response == null || !context.mounted) return;

                        context.read<ExpenseCategoryListBloc>().add(ExpenseCategoryListEvent.started());
                      },
                    );
                  },
                  onReorder: (int oldIndex, int newIndex) {
                    final event = ExpenseCategoryListEvent.reordered(oldIndex: oldIndex, newIndex: newIndex);
                    context.read<ExpenseCategoryListBloc>().add(event);
                  },
                );
              },
            ),
          ),
          floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
              onPressed: () async {
                final response = await showDialog<ExpenseCategory>(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => CategoryFormDialog(),
                );
                if (response == null || !context.mounted) return;

                context.read<ExpenseCategoryListBloc>().add(ExpenseCategoryListEvent.started());
              },
              child: Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}
