import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../database.dart';
import '../../../logics/income_category.logic.dart';
import 'bloc/income_category_form_bloc.dart';

class IncomeCategoryFormDialog extends StatefulWidget {
  const IncomeCategoryFormDialog({
    super.key,
    this.categoryToUpdate,
  });

  final IncomeCategory? categoryToUpdate;

  @override
  State<IncomeCategoryFormDialog> createState() => _IncomeCategoryFormDialogState();
}

class _IncomeCategoryFormDialogState extends State<IncomeCategoryFormDialog> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();

    final category = widget.categoryToUpdate;
    _nameController = TextEditingController(text: category?.name);
    _descriptionController = TextEditingController(text: category?.description);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IncomeCategoryFormBloc(
        incomeCategoryLogic: context.read<IncomeCategoryLogic>(),
        categoryToUpdate: widget.categoryToUpdate,
      ),
      child: BlocListener<IncomeCategoryFormBloc, IncomeCategoryFormState>(
        listenWhen: (previous, current) {
          return previous.incomeCategory != current.incomeCategory && current.incomeCategory != null;
        },
        listener: (context, state) => context.pop(state.incomeCategory),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 600),
          child: Form(
            key: _formKey,
            child: AlertDialog(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Text(widget.categoryToUpdate == null ? "New Category" : "Update Category")),
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
                      if (value == null || value.isEmpty) {
                        return "This field is required";
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(labelText: "Description"),
                    validator: (value) => null,
                  ),
                ],
              ),
              actions: [
                BlocBuilder<IncomeCategoryFormBloc, IncomeCategoryFormState>(
                  buildWhen: (previous, current) => previous.isSaving != current.isSaving,
                  builder: (context, state) {
                    final isSaving = state.isSaving;

                    return ElevatedButton(
                      onPressed: isSaving
                          ? null
                          : () {
                              final isValidated = _formKey.currentState?.validate();
                              if (isValidated == null || !isValidated) return;

                              final event = IncomeCategoryFormEvent.formSubmitted(
                                name: _nameController.text,
                                description: _descriptionController.text,
                              );
                              context.read<IncomeCategoryFormBloc>().add(event);
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
