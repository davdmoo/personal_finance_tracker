import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../database.dart';
import '../bloc/transaction_form_bloc.dart';

class TransferFormWidget extends StatefulWidget {
  const TransferFormWidget({super.key, this.populatedTransfer});

  final PopulatedTransfer? populatedTransfer;

  @override
  State<TransferFormWidget> createState() => TransferFormWidgetState();
}

class TransferFormWidgetState extends State<TransferFormWidget> {
  final _formKey = GlobalKey<FormState>();

  final _dateController = TextEditingController();
  final _amountController = TextEditingController();
  final _feeController = TextEditingController(text: "0");
  final _noteController = TextEditingController();

  Account? _selectedOrigin;
  Account? _selectedDestination;

  @override
  void initState() {
    super.initState();

    final populatedTransfer = widget.populatedTransfer;
    if (populatedTransfer == null) return;

    final transfer = populatedTransfer.transfer;
    _dateController.text = transfer.transactionDate.toIso8601String();
    _amountController.text = transfer.amount.toInt().toString();
    _feeController.text = transfer.fee.toInt().toString();
    _noteController.text = transfer.note;

    _selectedOrigin = populatedTransfer.accountOrigin;
    _selectedDestination = populatedTransfer.accountDestination;
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) return "This field is required";
                return null;
              },
            ),
            TextFormField(
              controller: _amountController,
              decoration: InputDecoration(label: Text("Amount")),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) return "This field is required";

                final parsed = double.tryParse(value);
                if (parsed == null) return "Invalid format";
                return null;
              },
            ),
            TextFormField(
              controller: _feeController,
              decoration: InputDecoration(label: Text("Fee")),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) return "This field is required";

                final parsed = double.tryParse(value);
                if (parsed == null) return "Invalid format";
                return null;
              },
            ),
            BlocBuilder<TransactionFormBloc, TransactionFormState>(
              buildWhen: (previous, current) => previous.accounts != current.accounts,
              builder: (context, state) {
                final accounts = state.accounts;

                return StatefulBuilder(
                  builder: (context, setState) => Autocomplete<Account>(
                    initialValue: TextEditingValue(text: _selectedOrigin?.name ?? ""),
                    displayStringForOption: (option) => option.name,
                    fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                      return TextFormField(
                        controller: controller,
                        focusNode: focusNode,
                        readOnly: _selectedOrigin != null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) return "This field is required";
                          if (_selectedOrigin == null) return "You have to select an origin account";

                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text("From"),
                          suffixIcon: _selectedOrigin != null
                              ? IconButton(
                                  onPressed: () {
                                    controller.clear();
                                    setState(() {
                                      _selectedOrigin = null;
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
                        _selectedOrigin = option;
                      });
                    },
                    optionsViewBuilder: (context, onSelected, iterableOptions) {
                      final allOptions = iterableOptions.toList();
                      final options = allOptions.where((opt) => opt.id != _selectedDestination?.id);

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
              buildWhen: (previous, current) => previous.accounts != current.accounts,
              builder: (context, state) {
                final accounts = state.accounts;

                return StatefulBuilder(
                  builder: (context, setState) => Autocomplete<Account>(
                    initialValue: TextEditingValue(text: _selectedDestination?.name ?? ""),
                    displayStringForOption: (option) => option.name,
                    fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                      return TextFormField(
                        controller: controller,
                        focusNode: focusNode,
                        readOnly: _selectedDestination != null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) return "This field is required";
                          if (_selectedDestination == null) return "You have to select a destination account";

                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text("To"),
                          suffixIcon: _selectedDestination != null
                              ? IconButton(
                                  onPressed: () {
                                    controller.clear();
                                    setState(() {
                                      _selectedDestination = null;
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
                        _selectedDestination = option;
                      });
                    },
                    optionsViewBuilder: (context, onSelected, iterableOptions) {
                      final allOptions = iterableOptions.toList();
                      final options = allOptions.where((opt) => opt.id != _selectedOrigin?.id);

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

                      final selectedOrigin = _selectedOrigin;
                      if (selectedOrigin == null) return;

                      final selectedDestination = _selectedDestination;
                      if (selectedDestination == null) return;

                      final event = TransactionFormEvent.transferFormSubmitted(
                        transactionDate: DateTime.parse(_dateController.text),
                        amount: double.parse(_amountController.text),
                        fee: double.parse(_feeController.text),
                        note: _noteController.text,
                        accountOrigin: selectedOrigin,
                        accountDestination: selectedDestination,
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
