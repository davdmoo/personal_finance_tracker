import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../database.dart';
import 'bloc/category_list_bloc.dart';
import 'form/category_form.widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final database = context.read<AppDatabase>();

    return BlocProvider(
      create: (context) => CategoryListBloc(db: database)..add(CategoryListEvent.started()),
      child: Scaffold(
        appBar: AppBar(title: Text("Categories")),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: BlocBuilder<CategoryListBloc, CategoryListState>(
            buildWhen: (previous, current) => previous.categories != current.categories,
            builder: (context, state) {
              final categories = state.categories;

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

                      context.read<CategoryListBloc>().add(CategoryListEvent.started());
                    },
                  );
                },
                onReorder: (int oldIndex, int newIndex) {},
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

              context.read<CategoryListBloc>().add(CategoryListEvent.started());
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
