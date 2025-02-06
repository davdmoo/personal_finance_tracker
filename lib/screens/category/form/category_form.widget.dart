import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../database.dart';
import 'bloc/category_form_bloc.dart';

class CategoryFormDialog extends StatefulWidget {
  const CategoryFormDialog({
    super.key,
    this.categoryToUpdate,
  });

  final ExpenseCategory? categoryToUpdate;

  @override
  State<CategoryFormDialog> createState() => _CategoryFormDialogState();
}

class _CategoryFormDialogState extends State<CategoryFormDialog> {
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
      create: (context) => CategoryFormBloc(
        db: context.read<AppDatabase>(),
        categoryId: widget.categoryToUpdate?.id,
      ),
      child: BlocListener<CategoryFormBloc, CategoryFormState>(
        listenWhen: (previous, current) {
          return previous.expenseCategory != current.expenseCategory && current.expenseCategory != null;
        },
        listener: (context, state) => context.pop(state.expenseCategory),
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
                BlocBuilder<CategoryFormBloc, CategoryFormState>(
                  buildWhen: (previous, current) => previous.isLoading != current.isLoading,
                  builder: (context, state) {
                    final isLoading = state.isLoading;

                    return ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              final isValidated = _formKey.currentState?.validate();
                              if (isValidated == null || !isValidated) return;

                              final event = CategoryFormEvent.formSubmitted(
                                name: _nameController.text,
                                description: _descriptionController.text,
                              );
                              context.read<CategoryFormBloc>().add(event);
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
