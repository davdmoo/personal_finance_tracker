import 'dart:async';

import 'package:drift/drift.dart' as drift;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../database.dart';
import '../../../../../extensions/string.extensions.dart';

part 'account_group_form_bloc.freezed.dart';
part 'account_group_form_event.dart';
part 'account_group_form_state.dart';

class AccountGroupFormBloc extends Bloc<AccountGroupFormEvent, AccountGroupFormState> {
  final AppDatabase db;
  final AccountGroup? accountGroup;

  AccountGroupFormBloc({required this.db, this.accountGroup}) : super(_AccountGroupFormState()) {
    on<AccountGroupFormEvent>(
      (events, emit) async {
        await events.map<FutureOr<void>>(
          started: (event) async => await _onStarted(event, emit),
          formSubmitted: (event) async => await _onFormSubmitted(event, emit),
        );
      },
    );
  }

  Future<void> _onStarted(_Started event, Emitter<AccountGroupFormState> emit) async {}

  Future<void> _onFormSubmitted(_FormSubmitted event, Emitter<AccountGroupFormState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final accountGroup = this.accountGroup;
      if (accountGroup == null) {
        final insertedData = await db.transaction<AccountGroup>(
          () async {
            // get the latest order from all account groups
            final selectStatement = (db.select(db.accountGroups))
              ..orderBy([(t) => drift.OrderingTerm(expression: t.order, mode: drift.OrderingMode.desc)])
              ..limit(1);
            final result = await selectStatement.get();
            final accountGroup = result.firstOrNull;

            final order = accountGroup?.order ?? 0;
            final data = AccountGroupsCompanion.insert(
              name: event.name.capitalized.trim(),
              order: order + 1,
            );
            final newAccountGroup = await db.into(db.accountGroups).insertReturning(data);

            return newAccountGroup;
          },
        );

        emit(state.copyWith(savedAccountGroup: insertedData));
      } else {
        final data = AccountGroupsCompanion(name: drift.Value(event.name.capitalized.trim()));
        final query = db.update(db.accountGroups)..where((tbl) => tbl.id.equals(accountGroup.id));
        final result = await query.writeReturning(data);

        final updatedAccountGroup = result.firstOrNull;
        if (updatedAccountGroup == null) {
          throw Exception("Account group is missing. It may have been deleted.");
        }

        emit(state.copyWith(savedAccountGroup: updatedAccountGroup));
      }
    } catch (err) {
      emit(
        state.copyWith(error: err is Exception ? err : Exception("Unknown error occurred. Please try again later.")),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
