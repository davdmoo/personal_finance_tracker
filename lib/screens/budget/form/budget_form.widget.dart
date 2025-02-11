import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../database.dart';
import '../../../logics/budget.logic.dart';
import '../../../logics/expense_category.logic.dart';
import 'bloc/budget_form_bloc.dart';

class BudgetFormDialog extends StatefulWidget {
  const BudgetFormDialog({super.key, this.budget});

  final Budget? budget;

  @override
  State<BudgetFormDialog> createState() => _BudgetFormDialogState();
}

class _BudgetFormDialogState extends State<BudgetFormDialog> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _limitController;
  ExpenseCategory? _selectedCategory;

  @override
  void initState() {
    super.initState();

    final budget = widget.budget;
    _limitController = TextEditingController(text: budget?.amount.toInt().toString());
  }

  @override
  void dispose() {
    _limitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BudgetFormBloc(
        budget: widget.budget,
        budgetLogic: context.read<BudgetLogic>(),
        expenseCategoryLogic: context.read<ExpenseCategoryLogic>(),
      )..add(BudgetFormEvent.started()),
      child: BlocListener<BudgetFormBloc, BudgetFormState>(
        listenWhen: (previous, current) => previous.savedBudget != current.savedBudget,
        listener: (context, state) {
          final savedBudget = state.savedBudget;
          if (savedBudget == null) return;

          context.pop(savedBudget);
        },
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 600),
          child: Form(
            key: _formKey,
            child: AlertDialog(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Text(widget.budget == null ? "New Budget" : "Update Budget")),
                  IconButton(onPressed: () => context.pop(), icon: Icon(Icons.close)),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _limitController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(labelText: "Amount"),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required";
                      }

                      return null;
                    },
                  ),
                  BlocBuilder<BudgetFormBloc, BudgetFormState>(
                    buildWhen: (previous, current) => previous.expenseCategories != current.expenseCategories,
                    builder: (context, state) {
                      final expenseCategories = state.expenseCategories;

                      return StatefulBuilder(
                        builder: (context, setState) => Autocomplete<ExpenseCategory>(
                          displayStringForOption: (option) => option.name,
                          optionsBuilder: (textEditingValue) {
                            final value = textEditingValue.text.toLowerCase();
                            if (value.isEmpty) return expenseCategories;

                            return expenseCategories.where((group) => group.name.toLowerCase().contains(value));
                          },
                          fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                            return BlocListener<BudgetFormBloc, BudgetFormState>(
                              listenWhen: (previous, current) =>
                                  previous.expenseCategories != current.expenseCategories,
                              listener: (context, state) {
                                // populate the budget if the user is updating
                                final budgetToUpdate = widget.budget;
                                if (budgetToUpdate == null) return;

                                final expenseCategories = state.expenseCategories;
                                final selected = expenseCategories.firstWhere(
                                  (group) => group.id == budgetToUpdate.categoryId,
                                );
                                _selectedCategory = selected;
                                controller.text = selected.name;
                              },
                              child: TextFormField(
                                controller: controller,
                                focusNode: focusNode,
                                readOnly: _selectedCategory != null,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) return "This field is required";
                                  if (_selectedCategory == null) return "You have to select a category";

                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text("Expense Category"),
                                  suffixIcon: _selectedCategory != null
                                      ? IconButton(
                                          onPressed: () {
                                            controller.clear();
                                            setState(() {
                                              _selectedCategory = null;
                                            });
                                          },
                                          icon: const Icon(Icons.clear, size: 16),
                                        )
                                      : null,
                                ),
                              ),
                            );
                          },
                          optionsViewBuilder: (context, onSelected, iterableOptions) {
                            final options = iterableOptions.toList();

                            return Align(
                              alignment: Alignment.topLeft,
                              child: Material(
                                elevation: 4,
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(maxHeight: 600, maxWidth: 240),
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: options.length,
                                    itemBuilder: (context, index) {
                                      final expenseCategory = options.elementAt(index);

                                      return ListTile(
                                        title: Text(expenseCategory.name),
                                        onTap: () => onSelected(expenseCategory),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                          onSelected: (option) {
                            setState(() {
                              _selectedCategory = option;
                            });
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
              actions: [
                BlocBuilder<BudgetFormBloc, BudgetFormState>(
                  buildWhen: (previous, current) => previous.isSaving != current.isSaving,
                  builder: (context, state) {
                    final isSaving = state.isSaving;

                    return ElevatedButton(
                      onPressed: isSaving
                          ? null
                          : () {
                              final limit = double.tryParse(_limitController.text);
                              if (limit == null) return;

                              final selectedCategory = _selectedCategory;
                              if (selectedCategory == null) return;

                              final isValidated = _formKey.currentState?.validate();
                              if (isValidated == null || !isValidated) return;

                              final event = BudgetFormEvent.formSubmitted(
                                amount: limit,
                                category: selectedCategory,
                              );
                              context.read<BudgetFormBloc>().add(event);
                            },
                      child: Text("Submit"),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
