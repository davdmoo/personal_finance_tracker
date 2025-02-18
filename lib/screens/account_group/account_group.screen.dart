import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../database.dart';
import '../../logics/account_group.logic.dart';
import 'bloc/account_group_bloc.dart';
import 'widgets/form/account_group_form.widget.dart';

class AccountGroupScreen extends StatelessWidget {
  const AccountGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountGroupBloc(context.read<AccountGroupLogic>())..add(AccountGroupEvent.started()),
      child: Scaffold(
        appBar: AppBar(title: Text("Account Groups")),
        body: BlocBuilder<AccountGroupBloc, AccountGroupState>(
          buildWhen: (previous, current) => previous.accountGroups != current.accountGroups,
          builder: (context, state) {
            final accountGroups = state.accountGroups;
            return ReorderableListView.builder(
              itemBuilder: (context, index) {
                final accountGroup = accountGroups[index];

                return ListTile(
                  key: Key(accountGroup.id.toString()),
                  title: Text(accountGroup.name),
                  onTap: () async {
                    final result = await showDialog<AccountGroup>(
                      context: context,
                      builder: (context) => AccountGroupFormWidget(accountGroupToUpdate: accountGroup),
                    );
                    if (result == null || !context.mounted) return;

                    context.read<AccountGroupBloc>().add(AccountGroupEvent.started());
                  },
                );
              },
              itemCount: accountGroups.length,
              onReorder: (oldIndex, newIndex) {
                final event = AccountGroupEvent.reordered(oldIndex: oldIndex, newIndex: newIndex);
                context.read<AccountGroupBloc>().add(event);
              },
            );
          },
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async {
              final result = await showDialog<AccountGroup>(
                context: context,
                builder: (context) => AccountGroupFormWidget(),
              );
              if (result == null || !context.mounted) return;

              context.read<AccountGroupBloc>().add(AccountGroupEvent.started());
            },
          ),
        ),
      ),
    );
  }
}
