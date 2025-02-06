import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../database.dart';
import 'bloc/currency_form_bloc.dart';

class CurrencyFormDialog extends StatefulWidget {
  const CurrencyFormDialog({super.key, this.currencyToUpdate});

  final Currency? currencyToUpdate;

  @override
  State<CurrencyFormDialog> createState() => _CurrencyFormDialogState();
}

class _CurrencyFormDialogState extends State<CurrencyFormDialog> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _codeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _nameController.text = widget.currencyToUpdate?.name ?? "";
    _codeController.text = widget.currencyToUpdate?.code ?? "";
  }

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final db = context.read<AppDatabase>();

    return BlocProvider(
      create: (context) => CurrencyFormBloc(db: db, currency: widget.currencyToUpdate),
      child: BlocListener<CurrencyFormBloc, CurrencyFormState>(
        listenWhen: (previous, current) => previous.savedCurrency != current.savedCurrency,
        listener: (context, state) {
          final savedCurrency = state.savedCurrency;
          if (savedCurrency == null) return;

          context.pop(savedCurrency);
        },
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 600),
          child: Form(
            key: _formKey,
            child: AlertDialog(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Text(widget.currencyToUpdate == null ? "New Currency" : "Update Currency")),
                  IconButton(onPressed: () => context.pop(), icon: Icon(Icons.close)),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(labelText: "Name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) return "This field is required";
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _codeController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(labelText: "Code"),
                    inputFormatters: [
                      TextInputFormatter.withFunction(
                        (oldValue, newValue) => TextEditingValue(
                          text: newValue.text.toUpperCase(),
                          selection: newValue.selection,
                        ),
                      ),
                    ],
                    textCapitalization: TextCapitalization.characters,
                    validator: (value) {
                      if (value == null || value.isEmpty) return "This field is required";
                      return null;
                    },
                  ),
                ],
              ),
              actions: [
                BlocBuilder<CurrencyFormBloc, CurrencyFormState>(
                  buildWhen: (previous, current) => previous.isSaving != current.isSaving,
                  builder: (context, state) {
                    final isSaving = state.isSaving;

                    return ElevatedButton(
                      onPressed: isSaving
                          ? null
                          : () {
                              final isValidated = _formKey.currentState?.validate();
                              if (isValidated == null || !isValidated) return;

                              final event = CurrencyFormEvent.formSubmitted(
                                name: _nameController.text,
                                code: _codeController.text,
                              );
                              context.read<CurrencyFormBloc>().add(event);
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
