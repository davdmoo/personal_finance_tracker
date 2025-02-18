import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../database.dart';
import '../bloc/transaction_form_bloc.dart';

class ExpenseFormWidget extends StatefulWidget {
  const ExpenseFormWidget({super.key, this.populatedExpense});

  final PopulatedExpense? populatedExpense;

  @override
  State<ExpenseFormWidget> createState() => ExpenseFormWidgetState();
}

class ExpenseFormWidgetState extends State<ExpenseFormWidget> {
  final _formKey = GlobalKey<FormState>();

  final _dateController = TextEditingController();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

  Account? _selectedAccount;
  ExpenseCategory? _selectedCategory;

  @override
  void initState() {
    super.initState();

    final populatedExpense = widget.populatedExpense;
    if (populatedExpense == null) return;

    final expense = populatedExpense.expense;
    _dateController.text = expense.transactionDate.toIso8601String();
    _amountController.text = expense.amount.toString();
    _noteController.text = expense.note;

    _selectedAccount = populatedExpense.account;
    _selectedCategory = populatedExpense.category;
  }

  @override
  void dispose() {
    _dateController.dispose();
    _amountController.dispose();
    _noteController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          spacing: 8,
          children: [
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(label: Text("Date")),
              readOnly: true,
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime.fromMillisecondsSinceEpoch(0),
                  lastDate: DateTime.now().add(Duration(days: 365 * 100)),
                );
                if (date == null) return;

                setState(() {
                  _dateController.text = date.toIso8601String();
                });
              },
            ),
            TextFormField(
              controller: _amountController,
              decoration: InputDecoration(label: Text("Amount")),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            BlocBuilder<TransactionFormBloc, TransactionFormState>(
              buildWhen: (previous, current) => previous.accounts != current.accounts,
              builder: (context, state) {
                final accounts = state.accounts;

                return StatefulBuilder(
                  builder: (context, setState) => Autocomplete<Account>(
                    initialValue: TextEditingValue(text: _selectedAccount?.name ?? ""),
                    displayStringForOption: (option) => option.name,
                    fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                      return TextFormField(
                        controller: controller,
                        focusNode: focusNode,
                        readOnly: _selectedAccount != null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) return "This field is required";
                          if (_selectedAccount == null) return "You have to select an account";

                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text("Account"),
                          suffixIcon: _selectedAccount != null
                              ? IconButton(
                                  onPressed: () {
                                    controller.clear();
                                    setState(() {
                                      _selectedAccount = null;
                                    });
                                  },
                                  icon: const Icon(Icons.clear, size: 16),
                                )
                              : null,
                        ),
                      );
                    },
                    optionsBuilder: (textEditingValue) {
                      final value = textEditingValue.text.toLowerCase();
                      if (value.isEmpty) return accounts;

                      return accounts.where((account) => account.name.toLowerCase().contains(value));
                    },
                    onSelected: (option) {
                      setState(() {
                        _selectedAccount = option;
                      });
                    },
                    optionsViewBuilder: (context, onSelected, iterableOptions) {
                      final options = iterableOptions.toList();

                      return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          elevation: 4,
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxHeight: 600, maxWidth: 360),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: options.length,
                              itemBuilder: (context, index) {
                                final account = options.elementAt(index);

                                return ListTile(
                                  title: Text(account.name),
                                  onTap: () => onSelected(account),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            BlocBuilder<TransactionFormBloc, TransactionFormState>(
              buildWhen: (previous, current) => previous.expenseCategories != current.expenseCategories,
              builder: (context, state) {
                final expenseCategories = state.expenseCategories;

                return StatefulBuilder(
                  builder: (context, setState) => Autocomplete<ExpenseCategory>(
                    initialValue: TextEditingValue(text: _selectedCategory?.name ?? ""),
                    displayStringForOption: (option) => option.name,
                    fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) => TextFormField(
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
                        label: Text("Category"),
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
                    optionsBuilder: (textEditingValue) {
                      final value = textEditingValue.text.toLowerCase();
                      if (value.isEmpty) return expenseCategories;

                      return expenseCategories.where((account) => account.name.toLowerCase().contains(value));
                    },
                    onSelected: (option) {
                      setState(() {
                        _selectedCategory = option;
                      });
                    },
                    optionsViewBuilder: (context, onSelected, iterableOptions) {
                      final options = iterableOptions.toList();

                      return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          elevation: 4,
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxHeight: 600, maxWidth: 360),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: options.length,
                              itemBuilder: (context, index) {
                                final account = options.elementAt(index);

                                return ListTile(
                                  title: Text(account.name),
                                  onTap: () => onSelected(account),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            TextFormField(
              controller: _noteController,
              decoration: InputDecoration(label: Text("Note")),
            ),
            SizedBox(height: 8),
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final isValidated = _formKey.currentState?.validate() ?? false;
                      if (!isValidated) return;

                      final selectedAccount = _selectedAccount;
                      if (selectedAccount == null) return;

                      final selectedCategory = _selectedCategory;
                      if (selectedCategory == null) return;

                      final event = TransactionFormEvent.expenseFormSubmitted(
                        transactionDate: DateTime.parse(_dateController.text),
                        amount: double.parse(_amountController.text),
                        account: selectedAccount,
                        category: selectedCategory,
                        note: _noteController.text,
                      );
                      context.read<TransactionFormBloc>().add(event);
                    },
                    child: Text("Save"),
                  ),
                ),
                Expanded(child: ElevatedButton(onPressed: null, child: Text("Continue"))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
