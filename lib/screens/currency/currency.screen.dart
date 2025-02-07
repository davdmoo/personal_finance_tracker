import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../database.dart';
import '../../logics/currency.logic.dart';
import 'bloc/currency_list_bloc.dart';
import 'widgets/form/currency_form.widget.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrencyListBloc(context.read<CurrencyLogic>())..add(CurrencyListEvent.started()),
      child: Scaffold(
        appBar: AppBar(title: Text("Currencies")),
        body: BlocBuilder<CurrencyListBloc, CurrencyListState>(
          buildWhen: (previous, current) => previous.currencies != current.currencies,
          builder: (context, state) {
            final currencies = state.currencies;

            return ListView.builder(
              itemCount: currencies.length,
              itemBuilder: (context, index) {
                final currency = currencies[index];

                return ListTile(
                  title: Text(currency.name),
                  subtitle: Text(currency.code),
                  onTap: () async {
                    final result = await showDialog<Currency>(
                      context: context,
                      builder: (context) => CurrencyFormDialog(currencyToUpdate: currency),
                    );
                    if (result == null || !context.mounted) return;

                    context.read<CurrencyListBloc>().add(CurrencyListEvent.started());
                  },
                );
              },
            );
          },
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async {
              final result = await showDialog<Currency>(
                context: context,
                builder: (context) => CurrencyFormDialog(),
              );
              if (result == null || !context.mounted) return;

              context.read<CurrencyListBloc>().add(CurrencyListEvent.started());
            },
          ),
        ),
      ),
    );
  }
}
