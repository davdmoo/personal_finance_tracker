import 'dart:async';

import 'package:drift/drift.dart' as drift;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../database.dart';
import '../../../../../extensions/string.extensions.dart';

part 'account_form_bloc.freezed.dart';
part 'account_form_event.dart';
part 'account_form_state.dart';

class AccountFormBloc extends Bloc<AccountFormEvent, AccountFormState> {
  final AppDatabase db;
  final Account? account;

  AccountFormBloc({required this.db, this.account}) : super(_AccountFormState()) {
    on<AccountFormEvent>((events, emit) async {
      await events.map<FutureOr<void>>(
        started: (event) async => await _onStarted(event, emit),
        formSubmitted: (event) async => await _onFormSubmitted(event, emit),
      );
    });
  }

  Future<void> _onStarted(_Started event, Emitter<AccountFormState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final selectStatement = (db.select(db.accountGroups))..orderBy([(t) => drift.OrderingTerm.asc(t.order)]);
      final accountGroups = await selectStatement.get();

      emit(state.copyWith(accountGroups: accountGroups));
    } catch (err) {
      emit(state.copyWith(error: Exception(err.toString())));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onFormSubmitted(_FormSubmitted event, Emitter<AccountFormState> emit) async {
    try {
      emit(state.copyWith(isSaving: true));

      final account = this.account;
      if (account == null) {
        final insertedData = await db.transaction<Account>(
          () async {
            // get the latest order from all accounts
            final selectStatement = (db.select(db.accounts))
              ..orderBy([(t) => drift.OrderingTerm(expression: t.order, mode: drift.OrderingMode.desc)])
              ..limit(1);
            final result = await selectStatement.get();
            final highestOrderAccount = result.firstOrNull;

            final order = highestOrderAccount?.order ?? 0;
            final data = AccountsCompanion.insert(
              name: event.name.capitalized.trim(),
              order: order + 1,
              accountGroupId: event.accountGroup.id,
            );
            final newAccount = await db.into(db.accounts).insertReturning(data);

            return newAccount;
          },
        );

        emit(state.copyWith(savedAccount: insertedData));
      } else {
        final data = AccountsCompanion(name: drift.Value(event.name.capitalized.trim()));
        final query = db.update(db.accounts)..where((tbl) => tbl.id.equals(account.id));
        final result = await query.writeReturning(data);

        final updatedAccount = result.firstOrNull;
        if (updatedAccount == null) {
          throw Exception("Account is missing. It may have been deleted.");
        }

        emit(state.copyWith(savedAccount: updatedAccount));
      }
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isSaving: false));
    }
  }
}
