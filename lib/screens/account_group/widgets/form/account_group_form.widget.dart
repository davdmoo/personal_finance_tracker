import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../database.dart';
import 'bloc/account_group_form_bloc.dart';

class AccountGroupFormWidget extends StatefulWidget {
  const AccountGroupFormWidget({super.key, this.accountGroupToUpdate});

  final AccountGroup? accountGroupToUpdate;

  @override
  State<AccountGroupFormWidget> createState() => _AccountGroupFormWidgetState();
}

class _AccountGroupFormWidgetState extends State<AccountGroupFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _nameController.text = widget.accountGroupToUpdate?.name ?? "";
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountGroupFormBloc(
        db: context.read<AppDatabase>(),
        accountGroup: widget.accountGroupToUpdate,
      ),
      child: BlocListener<AccountGroupFormBloc, AccountGroupFormState>(
        listenWhen: (previous, current) => previous.savedAccountGroup != current.savedAccountGroup,
        listener: (context, state) {
          final savedAccountGroup = state.savedAccountGroup;
          if (savedAccountGroup == null) return;

          context.pop(state.savedAccountGroup);
        },
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 600),
          child: Form(
            key: _formKey,
            child: AlertDialog(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Text(widget.accountGroupToUpdate == null ? "New Group" : "Update Group")),
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
                ],
              ),
              actions: [
                BlocBuilder<AccountGroupFormBloc, AccountGroupFormState>(
                  buildWhen: (previous, current) => previous.isLoading != current.isLoading,
                  builder: (context, state) {
                    final isLoading = state.isLoading;

                    return ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              final isValidated = _formKey.currentState?.validate();
                              if (isValidated == null || !isValidated) return;

                              final event = AccountGroupFormEvent.formSubmitted(name: _nameController.text);
                              context.read<AccountGroupFormBloc>().add(event);
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
