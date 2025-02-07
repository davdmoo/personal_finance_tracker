import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../database.dart';
import '../../../../logics/account.logic.dart';
import '../../../../logics/account_group.logic.dart';
import 'bloc/account_form_bloc.dart';

class AccountFormWidget extends StatefulWidget {
  const AccountFormWidget({super.key, this.accountToUpdate});

  final Account? accountToUpdate;

  @override
  State<AccountFormWidget> createState() => _AccountFormWidgetState();
}

class _AccountFormWidgetState extends State<AccountFormWidget> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  AccountGroup? _selectedAccountGroup;

  @override
  void initState() {
    super.initState();

    _nameController.text = widget.accountToUpdate?.name ?? "";
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountFormBloc(
        accountGroupLogic: context.read<AccountGroupLogic>(),
        accountLogic: context.read<AccountLogic>(),
        account: widget.accountToUpdate,
      )..add(AccountFormEvent.started()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<AccountFormBloc, AccountFormState>(
            listenWhen: (previous, current) => previous.savedAccount != current.savedAccount,
            listener: (context, state) {
              final savedAccount = state.savedAccount;
              if (savedAccount == null) return;

              context.pop(savedAccount);
            },
          ),
        ],
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 600),
          child: Form(
            key: _formKey,
            child: AlertDialog(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Text(widget.accountToUpdate == null ? "New Account" : "Update Account")),
                  IconButton(onPressed: () => context.pop(), icon: Icon(Icons.close)),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 8,
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
                  BlocBuilder<AccountFormBloc, AccountFormState>(
                    buildWhen: (previous, current) => previous.accountGroups != current.accountGroups,
                    builder: (context, state) {
                      final accountGroups = state.accountGroups;

                      return StatefulBuilder(
                        builder: (context, setState) => Autocomplete<AccountGroup>(
                          displayStringForOption: (option) => option.name,
                          optionsBuilder: (textEditingValue) {
                            final value = textEditingValue.text.toLowerCase();
                            if (value.isEmpty) return accountGroups;

                            return accountGroups.where((group) => group.name.toLowerCase().contains(value));
                          },
                          fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                            return BlocListener<AccountFormBloc, AccountFormState>(
                              listenWhen: (previous, current) => previous.accountGroups != current.accountGroups,
                              listener: (context, state) {
                                // populate the account group if the user is updating
                                final accountToUpdate = widget.accountToUpdate;
                                if (accountToUpdate == null) return;

                                final accountGroups = state.accountGroups;
                                final selected = accountGroups.firstWhere(
                                  (group) => group.id == accountToUpdate.accountGroupId,
                                );
                                setState(() {
                                  _selectedAccountGroup = selected;
                                  controller.text = selected.name;
                                });
                              },
                              child: TextFormField(
                                controller: controller,
                                focusNode: focusNode,
                                readOnly: _selectedAccountGroup != null,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) return "This field is required";
                                  if (_selectedAccountGroup == null) return "You have to select a group";

                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text("Account Group"),
                                  suffixIcon: _selectedAccountGroup != null
                                      ? IconButton(
                                          onPressed: () {
                                            controller.clear();
                                            setState(() {
                                              _selectedAccountGroup = null;
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
                                      final accountGroup = options.elementAt(index);

                                      return ListTile(
                                        title: Text(accountGroup.name),
                                        onTap: () => onSelected(accountGroup),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                          onSelected: (option) {
                            setState(() {
                              _selectedAccountGroup = option;
                            });
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
              actions: [
                BlocBuilder<AccountFormBloc, AccountFormState>(
                  buildWhen: (previous, current) => previous.isSaving != current.isSaving,
                  builder: (context, state) {
                    final isSaving = state.isSaving;

                    return ElevatedButton(
                      onPressed: isSaving
                          ? null
                          : () {
                              final isValidated = _formKey.currentState?.validate();
                              if (isValidated == null || !isValidated) return;

                              final selectedAccountGroup = _selectedAccountGroup;
                              if (selectedAccountGroup == null) return;

                              final event = AccountFormEvent.formSubmitted(
                                name: _nameController.text,
                                accountGroup: selectedAccountGroup,
                              );
                              context.read<AccountFormBloc>().add(event);
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
