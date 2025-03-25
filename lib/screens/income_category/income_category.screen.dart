import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../database.dart';
import '../../logics/income_category.logic.dart';
import 'bloc/income_category_list_bloc.dart';
import 'form/income_category_form.widget.dart';

class IncomeCategoryScreen extends StatelessWidget {
  const IncomeCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IncomeCategoryListBloc(
        context.read<IncomeCategoryLogic>(),
      )..add(IncomeCategoryListEvent.started()),
      child: Scaffold(
        appBar: AppBar(title: Text("Categories")),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: BlocBuilder<IncomeCategoryListBloc, IncomeCategoryListState>(
            buildWhen: (previous, current) => previous.incomeCategories != current.incomeCategories,
            builder: (context, state) {
              final categories = state.incomeCategories;

              return ReorderableListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];

                  return ListTile(
                    key: Key(category.id.toString()),
                    title: Text(category.name),
                    subtitle: Text(category.description ?? ""),
                    onTap: () async {
                      final response = await showDialog<IncomeCategory>(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => IncomeCategoryFormDialog(categoryToUpdate: category),
                      );
                      if (response == null || !context.mounted) return;

                      context.read<IncomeCategoryListBloc>().add(IncomeCategoryListEvent.started());
                    },
                    trailing: ReorderableDragStartListener(
                      index: index,
                      child: Platform.isAndroid ? Icon(Icons.drag_handle) : SizedBox.shrink(),
                    ),
                  );
                },
                onReorder: (int oldIndex, int newIndex) {
                  final event = IncomeCategoryListEvent.reordered(oldIndex: oldIndex, newIndex: newIndex);
                  context.read<IncomeCategoryListBloc>().add(event);
                },
              );
            },
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () async {
              final response = await showDialog<IncomeCategory>(
                context: context,
                barrierDismissible: false,
                builder: (context) => IncomeCategoryFormDialog(),
              );
              if (response == null || !context.mounted) return;

              context.read<IncomeCategoryListBloc>().add(IncomeCategoryListEvent.started());
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
