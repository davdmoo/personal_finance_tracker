import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../database.dart';
import '../bloc/transaction_form_bloc.dart';

class AccountAutocomplete extends StatefulWidget {
  const AccountAutocomplete({super.key});

  @override
  State<AccountAutocomplete> createState() => _AccountAutocompleteState();
}

class _AccountAutocompleteState extends State<AccountAutocomplete> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionFormBloc, TransactionFormState>(
      buildWhen: (previous, current) => previous.accounts != current.accounts,
      builder: (context, state) {
        final accounts = state.accounts;

        return Autocomplete<Account>(
          optionsBuilder: (textEditingValue) {
            final value = textEditingValue.text.toLowerCase();
            if (value.isEmpty) return accounts;

            return accounts.where((account) => account.name.toLowerCase().contains(value));
          },
        );
      },
    );
  }
}
