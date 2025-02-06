import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../database.dart';
import 'bloc/account_bloc.dart';
import 'widgets/form/account_form.widget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountBloc(context.read<AppDatabase>())..add(AccountEvent.started()),
      child: Scaffold(
        appBar: AppBar(title: Text("Accounts")),
        body: BlocBuilder<AccountBloc, AccountState>(
          buildWhen: (previous, current) => previous.accounts != current.accounts,
          builder: (context, state) {
            final accounts = state.accounts;

            return ReorderableListView.builder(
              itemBuilder: (context, index) {
                final account = accounts[index];
                return ListTile(
                  key: Key(account.id.toString()),
                  title: Text(account.name),
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
              onReorder: (oldIndex, newIndex) {},
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
