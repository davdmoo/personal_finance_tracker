import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../database.dart';
import '../../extensions/double.extension.dart';
import '../../logics/account.logic.dart';
import 'bloc/account_bloc.dart';
import 'widgets/form/account_form.widget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountBloc(context.read<AccountLogic>())..add(AccountEvent.started()),
      child: Scaffold(
        appBar: AppBar(title: Text("Accounts")),
        body: BlocBuilder<AccountBloc, AccountState>(
          buildWhen: (previous, current) => previous.accounts != current.accounts,
          builder: (context, state) {
            final accounts = state.accounts;

            return ReorderableListView.builder(
              itemBuilder: (context, index) {
                final item = accounts[index];
                final account = item.account;

                return ListTile(
                  key: Key(account.id.toString()),
                  title: Text(account.name),
                  subtitle: Text("Balance: ${item.balance.currency}"),
                  onTap: () async {
                    final result = await showDialog<Account>(
                      context: context,
                      builder: (context) => AccountFormWidget(accountToUpdate: account),
                    );
                    if (result == null || !context.mounted) return;

                    context.read<AccountBloc>().add(AccountEvent.started());
                  },
                );
              },
              itemCount: accounts.length,
              onReorder: (oldIndex, newIndex) {
                final event = AccountEvent.reordered(oldIndex: oldIndex, newIndex: newIndex);
                context.read<AccountBloc>().add(event);
              },
            );
          },
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () async {
              final result = await showDialog<Account>(
                context: context,
                builder: (context) => AccountFormWidget(),
              );
              if (result == null || !context.mounted) return;

              context.read<AccountBloc>().add(AccountEvent.started());
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
