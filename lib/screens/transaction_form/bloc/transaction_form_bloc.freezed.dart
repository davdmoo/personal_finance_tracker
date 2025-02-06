// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            DateTime transactionDate,
            double amount,
            Account account,
            ExpenseCategory category,
            Currency currency,
            String? note)
        expenseFormSubmitted,
    required TResult Function(
            DateTime transactionDate,
            double amount,
            Account account,
            IncomeCategory category,
            Currency currency,
            String? note)
        incomeFormSubmitted,
    required TResult Function(
            DateTime transactionDate,
            double amount,
            double fee,
            Account accountOrigin,
            Account accountDestination,
            Currency currency,
            String? note)
        transferFormSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DateTime transactionDate, double amount, Account account,
            ExpenseCategory category, Currency currency, String? note)?
        expenseFormSubmitted,
    TResult? Function(DateTime transactionDate, double amount, Account account,
            IncomeCategory category, Currency currency, String? note)?
        incomeFormSubmitted,
    TResult? Function(
            DateTime transactionDate,
            double amount,
            double fee,
            Account accountOrigin,
            Account accountDestination,
            Currency currency,
            String? note)?
        transferFormSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DateTime transactionDate, double amount, Account account,
            ExpenseCategory category, Currency currency, String? note)?
        expenseFormSubmitted,
    TResult Function(DateTime transactionDate, double amount, Account account,
            IncomeCategory category, Currency currency, String? note)?
        incomeFormSubmitted,
    TResult Function(
            DateTime transactionDate,
            double amount,
            double fee,
            Account accountOrigin,
            Account accountDestination,
            Currency currency,
            String? note)?
        transferFormSubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ExpenseFormSubmitted value) expenseFormSubmitted,
    required TResult Function(_IncomeFormSubmitted value) incomeFormSubmitted,
    required TResult Function(_TransferFormSubmitted value)
        transferFormSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ExpenseFormSubmitted value)? expenseFormSubmitted,
    TResult? Function(_IncomeFormSubmitted value)? incomeFormSubmitted,
    TResult? Function(_TransferFormSubmitted value)? transferFormSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ExpenseFormSubmitted value)? expenseFormSubmitted,
    TResult Function(_IncomeFormSubmitted value)? incomeFormSubmitted,
    TResult Function(_TransferFormSubmitted value)? transferFormSubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionFormEventCopyWith<$Res> {
  factory $TransactionFormEventCopyWith(TransactionFormEvent value,
          $Res Function(TransactionFormEvent) then) =
      _$TransactionFormEventCopyWithImpl<$Res, TransactionFormEvent>;
}

/// @nodoc
class _$TransactionFormEventCopyWithImpl<$Res,
        $Val extends TransactionFormEvent>
    implements $TransactionFormEventCopyWith<$Res> {
  _$TransactionFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionFormEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$TransactionFormEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionFormEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'TransactionFormEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            DateTime transactionDate,
            double amount,
            Account account,
            ExpenseCategory category,
            Currency currency,
            String? note)
        expenseFormSubmitted,
    required TResult Function(
            DateTime transactionDate,
            double amount,
            Account account,
            IncomeCategory category,
            Currency currency,
            String? note)
        incomeFormSubmitted,
    required TResult Function(
            DateTime transactionDate,
            double amount,
            double fee,
            Account accountOrigin,
            Account accountDestination,
            Currency currency,
            String? note)
        transferFormSubmitted,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DateTime transactionDate, double amount, Account account,
            ExpenseCategory category, Currency currency, String? note)?
        expenseFormSubmitted,
    TResult? Function(DateTime transactionDate, double amount, Account account,
            IncomeCategory category, Currency currency, String? note)?
        incomeFormSubmitted,
    TResult? Function(
            DateTime transactionDate,
            double amount,
            double fee,
            Account accountOrigin,
            Account accountDestination,
            Currency currency,
            String? note)?
        transferFormSubmitted,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DateTime transactionDate, double amount, Account account,
            ExpenseCategory category, Currency currency, String? note)?
        expenseFormSubmitted,
    TResult Function(DateTime transactionDate, double amount, Account account,
            IncomeCategory category, Currency currency, String? note)?
        incomeFormSubmitted,
    TResult Function(
            DateTime transactionDate,
            double amount,
            double fee,
            Account accountOrigin,
            Account accountDestination,
            Currency currency,
            String? note)?
        transferFormSubmitted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ExpenseFormSubmitted value) expenseFormSubmitted,
    required TResult Function(_IncomeFormSubmitted value) incomeFormSubmitted,
    required TResult Function(_TransferFormSubmitted value)
        transferFormSubmitted,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ExpenseFormSubmitted value)? expenseFormSubmitted,
    TResult? Function(_IncomeFormSubmitted value)? incomeFormSubmitted,
    TResult? Function(_TransferFormSubmitted value)? transferFormSubmitted,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ExpenseFormSubmitted value)? expenseFormSubmitted,
    TResult Function(_IncomeFormSubmitted value)? incomeFormSubmitted,
    TResult Function(_TransferFormSubmitted value)? transferFormSubmitted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements TransactionFormEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$ExpenseFormSubmittedImplCopyWith<$Res> {
  factory _$$ExpenseFormSubmittedImplCopyWith(_$ExpenseFormSubmittedImpl value,
          $Res Function(_$ExpenseFormSubmittedImpl) then) =
      __$$ExpenseFormSubmittedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {DateTime transactionDate,
      double amount,
      Account account,
      ExpenseCategory category,
      Currency currency,
      String? note});
}

/// @nodoc
class __$$ExpenseFormSubmittedImplCopyWithImpl<$Res>
    extends _$TransactionFormEventCopyWithImpl<$Res, _$ExpenseFormSubmittedImpl>
    implements _$$ExpenseFormSubmittedImplCopyWith<$Res> {
  __$$ExpenseFormSubmittedImplCopyWithImpl(_$ExpenseFormSubmittedImpl _value,
      $Res Function(_$ExpenseFormSubmittedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDate = null,
    Object? amount = null,
    Object? account = freezed,
    Object? category = freezed,
    Object? currency = freezed,
    Object? note = freezed,
  }) {
    return _then(_$ExpenseFormSubmittedImpl(
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ExpenseCategory,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ExpenseFormSubmittedImpl implements _ExpenseFormSubmitted {
  const _$ExpenseFormSubmittedImpl(
      {required this.transactionDate,
      required this.amount,
      required this.account,
      required this.category,
      required this.currency,
      this.note});

  @override
  final DateTime transactionDate;
  @override
  final double amount;
  @override
  final Account account;
  @override
  final ExpenseCategory category;
  @override
  final Currency currency;
  @override
  final String? note;

  @override
  String toString() {
    return 'TransactionFormEvent.expenseFormSubmitted(transactionDate: $transactionDate, amount: $amount, account: $account, category: $category, currency: $currency, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseFormSubmittedImpl &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality().equals(other.account, account) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.currency, currency) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionDate,
      amount,
      const DeepCollectionEquality().hash(account),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(currency),
      note);

  /// Create a copy of TransactionFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseFormSubmittedImplCopyWith<_$ExpenseFormSubmittedImpl>
      get copyWith =>
          __$$ExpenseFormSubmittedImplCopyWithImpl<_$ExpenseFormSubmittedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            DateTime transactionDate,
            double amount,
            Account account,
            ExpenseCategory category,
            Currency currency,
            String? note)
        expenseFormSubmitted,
    required TResult Function(
            DateTime transactionDate,
            double amount,
            Account account,
            IncomeCategory category,
            Currency currency,
            String? note)
        incomeFormSubmitted,
    required TResult Function(
            DateTime transactionDate,
            double amount,
            double fee,
            Account accountOrigin,
            Account accountDestination,
            Currency currency,
            String? note)
        transferFormSubmitted,
  }) {
    return expenseFormSubmitted(
        transactionDate, amount, account, category, currency, note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DateTime transactionDate, double amount, Account account,
            ExpenseCategory category, Currency currency, String? note)?
        expenseFormSubmitted,
    TResult? Function(DateTime transactionDate, double amount, Account account,
            IncomeCategory category, Currency currency, String? note)?
        incomeFormSubmitted,
    TResult? Function(
            DateTime transactionDate,
            double amount,
            double fee,
            Account accountOrigin,
            Account accountDestination,
            Currency currency,
            String? note)?
        transferFormSubmitted,
  }) {
    return expenseFormSubmitted?.call(
        transactionDate, amount, account, category, currency, note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DateTime transactionDate, double amount, Account account,
            ExpenseCategory category, Currency currency, String? note)?
        expenseFormSubmitted,
    TResult Function(DateTime transactionDate, double amount, Account account,
            IncomeCategory category, Currency currency, String? note)?
        incomeFormSubmitted,
    TResult Function(
            DateTime transactionDate,
            double amount,
            double fee,
            Account accountOrigin,
            Account accountDestination,
            Currency currency,
            String? note)?
        transferFormSubmitted,
    required TResult orElse(),
  }) {
    if (expenseFormSubmitted != null) {
      return expenseFormSubmitted(
          transactionDate, amount, account, category, currency, note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ExpenseFormSubmitted value) expenseFormSubmitted,
    required TResult Function(_IncomeFormSubmitted value) incomeFormSubmitted,
    required TResult Function(_TransferFormSubmitted value)
        transferFormSubmitted,
  }) {
    return expenseFormSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ExpenseFormSubmitted value)? expenseFormSubmitted,
    TResult? Function(_IncomeFormSubmitted value)? incomeFormSubmitted,
    TResult? Function(_TransferFormSubmitted value)? transferFormSubmitted,
  }) {
    return expenseFormSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ExpenseFormSubmitted value)? expenseFormSubmitted,
    TResult Function(_IncomeFormSubmitted value)? incomeFormSubmitted,
    TResult Function(_TransferFormSubmitted value)? transferFormSubmitted,
    required TResult orElse(),
  }) {
    if (expenseFormSubmitted != null) {
      return expenseFormSubmitted(this);
    }
    return orElse();
  }
}

abstract class _ExpenseFormSubmitted implements TransactionFormEvent {
  const factory _ExpenseFormSubmitted(
      {required final DateTime transactionDate,
      required final double amount,
      required final Account account,
      required final ExpenseCategory category,
      required final Currency currency,
      final String? note}) = _$ExpenseFormSubmittedImpl;

  DateTime get transactionDate;
  double get amount;
  Account get account;
  ExpenseCategory get category;
  Currency get currency;
  String? get note;

  /// Create a copy of TransactionFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseFormSubmittedImplCopyWith<_$ExpenseFormSubmittedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IncomeFormSubmittedImplCopyWith<$Res> {
  factory _$$IncomeFormSubmittedImplCopyWith(_$IncomeFormSubmittedImpl value,
          $Res Function(_$IncomeFormSubmittedImpl) then) =
      __$$IncomeFormSubmittedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {DateTime transactionDate,
      double amount,
      Account account,
      IncomeCategory category,
      Currency currency,
      String? note});
}

/// @nodoc
class __$$IncomeFormSubmittedImplCopyWithImpl<$Res>
    extends _$TransactionFormEventCopyWithImpl<$Res, _$IncomeFormSubmittedImpl>
    implements _$$IncomeFormSubmittedImplCopyWith<$Res> {
  __$$IncomeFormSubmittedImplCopyWithImpl(_$IncomeFormSubmittedImpl _value,
      $Res Function(_$IncomeFormSubmittedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDate = null,
    Object? amount = null,
    Object? account = freezed,
    Object? category = freezed,
    Object? currency = freezed,
    Object? note = freezed,
  }) {
    return _then(_$IncomeFormSubmittedImpl(
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as IncomeCategory,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$IncomeFormSubmittedImpl implements _IncomeFormSubmitted {
  const _$IncomeFormSubmittedImpl(
      {required this.transactionDate,
      required this.amount,
      required this.account,
      required this.category,
      required this.currency,
      this.note});

  @override
  final DateTime transactionDate;
  @override
  final double amount;
  @override
  final Account account;
  @override
  final IncomeCategory category;
  @override
  final Currency currency;
  @override
  final String? note;

  @override
  String toString() {
    return 'TransactionFormEvent.incomeFormSubmitted(transactionDate: $transactionDate, amount: $amount, account: $account, category: $category, currency: $currency, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomeFormSubmittedImpl &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality().equals(other.account, account) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.currency, currency) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionDate,
      amount,
      const DeepCollectionEquality().hash(account),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(currency),
      note);

  /// Create a copy of TransactionFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomeFormSubmittedImplCopyWith<_$IncomeFormSubmittedImpl> get copyWith =>
      __$$IncomeFormSubmittedImplCopyWithImpl<_$IncomeFormSubmittedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            DateTime transactionDate,
            double amount,
            Account account,
            ExpenseCategory category,
            Currency currency,
            String? note)
        expenseFormSubmitted,
    required TResult Function(
            DateTime transactionDate,
            double amount,
            Account account,
            IncomeCategory category,
            Currency currency,
            String? note)
        incomeFormSubmitted,
    required TResult Function(
            DateTime transactionDate,
            double amount,
            double fee,
            Account accountOrigin,
            Account accountDestination,
            Currency currency,
            String? note)
        transferFormSubmitted,
  }) {
    return incomeFormSubmitted(
        transactionDate, amount, account, category, currency, note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DateTime transactionDate, double amount, Account account,
            ExpenseCategory category, Currency currency, String? note)?
        expenseFormSubmitted,
    TResult? Function(DateTime transactionDate, double amount, Account account,
            IncomeCategory category, Currency currency, String? note)?
        incomeFormSubmitted,
    TResult? Function(
            DateTime transactionDate,
            double amount,
            double fee,
            Account accountOrigin,
            Account accountDestination,
            Currency currency,
            String? note)?
        transferFormSubmitted,
  }) {
    return incomeFormSubmitted?.call(
        transactionDate, amount, account, category, currency, note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DateTime transactionDate, double amount, Account account,
            ExpenseCategory category, Currency currency, String? note)?
        expenseFormSubmitted,
    TResult Function(DateTime transactionDate, double amount, Account account,
            IncomeCategory category, Currency currency, String? note)?
        incomeFormSubmitted,
    TResult Function(
            DateTime transactionDate,
            double amount,
            double fee,
            Account accountOrigin,
            Account accountDestination,
            Currency currency,
            String? note)?
        transferFormSubmitted,
    required TResult orElse(),
  }) {
    if (incomeFormSubmitted != null) {
      return incomeFormSubmitted(
          transactionDate, amount, account, category, currency, note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ExpenseFormSubmitted value) expenseFormSubmitted,
    required TResult Function(_IncomeFormSubmitted value) incomeFormSubmitted,
    required TResult Function(_TransferFormSubmitted value)
        transferFormSubmitted,
  }) {
    return incomeFormSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ExpenseFormSubmitted value)? expenseFormSubmitted,
    TResult? Function(_IncomeFormSubmitted value)? incomeFormSubmitted,
    TResult? Function(_TransferFormSubmitted value)? transferFormSubmitted,
  }) {
    return incomeFormSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ExpenseFormSubmitted value)? expenseFormSubmitted,
    TResult Function(_IncomeFormSubmitted value)? incomeFormSubmitted,
    TResult Function(_TransferFormSubmitted value)? transferFormSubmitted,
    required TResult orElse(),
  }) {
    if (incomeFormSubmitted != null) {
      return incomeFormSubmitted(this);
    }
    return orElse();
  }
}

abstract class _IncomeFormSubmitted implements TransactionFormEvent {
  const factory _IncomeFormSubmitted(
      {required final DateTime transactionDate,
      required final double amount,
      required final Account account,
      required final IncomeCategory category,
      required final Currency currency,
      final String? note}) = _$IncomeFormSubmittedImpl;

  DateTime get transactionDate;
  double get amount;
  Account get account;
  IncomeCategory get category;
  Currency get currency;
  String? get note;

  /// Create a copy of TransactionFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IncomeFormSubmittedImplCopyWith<_$IncomeFormSubmittedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransferFormSubmittedImplCopyWith<$Res> {
  factory _$$TransferFormSubmittedImplCopyWith(
          _$TransferFormSubmittedImpl value,
          $Res Function(_$TransferFormSubmittedImpl) then) =
      __$$TransferFormSubmittedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {DateTime transactionDate,
      double amount,
      double fee,
      Account accountOrigin,
      Account accountDestination,
      Currency currency,
      String? note});
}

/// @nodoc
class __$$TransferFormSubmittedImplCopyWithImpl<$Res>
    extends _$TransactionFormEventCopyWithImpl<$Res,
        _$TransferFormSubmittedImpl>
    implements _$$TransferFormSubmittedImplCopyWith<$Res> {
  __$$TransferFormSubmittedImplCopyWithImpl(_$TransferFormSubmittedImpl _value,
      $Res Function(_$TransferFormSubmittedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDate = null,
    Object? amount = null,
    Object? fee = null,
    Object? accountOrigin = freezed,
    Object? accountDestination = freezed,
    Object? currency = freezed,
    Object? note = freezed,
  }) {
    return _then(_$TransferFormSubmittedImpl(
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
      accountOrigin: freezed == accountOrigin
          ? _value.accountOrigin
          : accountOrigin // ignore: cast_nullable_to_non_nullable
              as Account,
      accountDestination: freezed == accountDestination
          ? _value.accountDestination
          : accountDestination // ignore: cast_nullable_to_non_nullable
              as Account,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TransferFormSubmittedImpl implements _TransferFormSubmitted {
  const _$TransferFormSubmittedImpl(
      {required this.transactionDate,
      required this.amount,
      required this.fee,
      required this.accountOrigin,
      required this.accountDestination,
      required this.currency,
      this.note});

  @override
  final DateTime transactionDate;
  @override
  final double amount;
  @override
  final double fee;
  @override
  final Account accountOrigin;
  @override
  final Account accountDestination;
  @override
  final Currency currency;
  @override
  final String? note;

  @override
  String toString() {
    return 'TransactionFormEvent.transferFormSubmitted(transactionDate: $transactionDate, amount: $amount, fee: $fee, accountOrigin: $accountOrigin, accountDestination: $accountDestination, currency: $currency, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferFormSubmittedImpl &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            const DeepCollectionEquality()
                .equals(other.accountOrigin, accountOrigin) &&
            const DeepCollectionEquality()
                .equals(other.accountDestination, accountDestination) &&
            const DeepCollectionEquality().equals(other.currency, currency) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionDate,
      amount,
      fee,
      const DeepCollectionEquality().hash(accountOrigin),
      const DeepCollectionEquality().hash(accountDestination),
      const DeepCollectionEquality().hash(currency),
      note);

  /// Create a copy of TransactionFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferFormSubmittedImplCopyWith<_$TransferFormSubmittedImpl>
      get copyWith => __$$TransferFormSubmittedImplCopyWithImpl<
          _$TransferFormSubmittedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            DateTime transactionDate,
            double amount,
            Account account,
            ExpenseCategory category,
            Currency currency,
            String? note)
        expenseFormSubmitted,
    required TResult Function(
            DateTime transactionDate,
            double amount,
            Account account,
            IncomeCategory category,
            Currency currency,
            String? note)
        incomeFormSubmitted,
    required TResult Function(
            DateTime transactionDate,
            double amount,
            double fee,
            Account accountOrigin,
            Account accountDestination,
            Currency currency,
            String? note)
        transferFormSubmitted,
  }) {
    return transferFormSubmitted(transactionDate, amount, fee, accountOrigin,
        accountDestination, currency, note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DateTime transactionDate, double amount, Account account,
            ExpenseCategory category, Currency currency, String? note)?
        expenseFormSubmitted,
    TResult? Function(DateTime transactionDate, double amount, Account account,
            IncomeCategory category, Currency currency, String? note)?
        incomeFormSubmitted,
    TResult? Function(
            DateTime transactionDate,
            double amount,
            double fee,
            Account accountOrigin,
            Account accountDestination,
            Currency currency,
            String? note)?
        transferFormSubmitted,
  }) {
    return transferFormSubmitted?.call(transactionDate, amount, fee,
        accountOrigin, accountDestination, currency, note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DateTime transactionDate, double amount, Account account,
            ExpenseCategory category, Currency currency, String? note)?
        expenseFormSubmitted,
    TResult Function(DateTime transactionDate, double amount, Account account,
            IncomeCategory category, Currency currency, String? note)?
        incomeFormSubmitted,
    TResult Function(
            DateTime transactionDate,
            double amount,
            double fee,
            Account accountOrigin,
            Account accountDestination,
            Currency currency,
            String? note)?
        transferFormSubmitted,
    required TResult orElse(),
  }) {
    if (transferFormSubmitted != null) {
      return transferFormSubmitted(transactionDate, amount, fee, accountOrigin,
          accountDestination, currency, note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ExpenseFormSubmitted value) expenseFormSubmitted,
    required TResult Function(_IncomeFormSubmitted value) incomeFormSubmitted,
    required TResult Function(_TransferFormSubmitted value)
        transferFormSubmitted,
  }) {
    return transferFormSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ExpenseFormSubmitted value)? expenseFormSubmitted,
    TResult? Function(_IncomeFormSubmitted value)? incomeFormSubmitted,
    TResult? Function(_TransferFormSubmitted value)? transferFormSubmitted,
  }) {
    return transferFormSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ExpenseFormSubmitted value)? expenseFormSubmitted,
    TResult Function(_IncomeFormSubmitted value)? incomeFormSubmitted,
    TResult Function(_TransferFormSubmitted value)? transferFormSubmitted,
    required TResult orElse(),
  }) {
    if (transferFormSubmitted != null) {
      return transferFormSubmitted(this);
    }
    return orElse();
  }
}

abstract class _TransferFormSubmitted implements TransactionFormEvent {
  const factory _TransferFormSubmitted(
      {required final DateTime transactionDate,
      required final double amount,
      required final double fee,
      required final Account accountOrigin,
      required final Account accountDestination,
      required final Currency currency,
      final String? note}) = _$TransferFormSubmittedImpl;

  DateTime get transactionDate;
  double get amount;
  double get fee;
  Account get accountOrigin;
  Account get accountDestination;
  Currency get currency;
  String? get note;

  /// Create a copy of TransactionFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferFormSubmittedImplCopyWith<_$TransferFormSubmittedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransactionFormState {
  Expense? get savedExpense => throw _privateConstructorUsedError;
  Income? get savedIncome => throw _privateConstructorUsedError;
  Transfer? get savedTransfer => throw _privateConstructorUsedError;
  List<Account> get accounts => throw _privateConstructorUsedError;
  List<Currency> get currencies => throw _privateConstructorUsedError;
  List<ExpenseCategory> get expenseCategories =>
      throw _privateConstructorUsedError;
  List<IncomeCategory> get incomeCategories =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  /// Create a copy of TransactionFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionFormStateCopyWith<TransactionFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionFormStateCopyWith<$Res> {
  factory $TransactionFormStateCopyWith(TransactionFormState value,
          $Res Function(TransactionFormState) then) =
      _$TransactionFormStateCopyWithImpl<$Res, TransactionFormState>;
  @useResult
  $Res call(
      {Expense? savedExpense,
      Income? savedIncome,
      Transfer? savedTransfer,
      List<Account> accounts,
      List<Currency> currencies,
      List<ExpenseCategory> expenseCategories,
      List<IncomeCategory> incomeCategories,
      bool isLoading,
      bool isSaving,
      Exception? error});
}

/// @nodoc
class _$TransactionFormStateCopyWithImpl<$Res,
        $Val extends TransactionFormState>
    implements $TransactionFormStateCopyWith<$Res> {
  _$TransactionFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savedExpense = freezed,
    Object? savedIncome = freezed,
    Object? savedTransfer = freezed,
    Object? accounts = null,
    Object? currencies = null,
    Object? expenseCategories = null,
    Object? incomeCategories = null,
    Object? isLoading = null,
    Object? isSaving = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      savedExpense: freezed == savedExpense
          ? _value.savedExpense
          : savedExpense // ignore: cast_nullable_to_non_nullable
              as Expense?,
      savedIncome: freezed == savedIncome
          ? _value.savedIncome
          : savedIncome // ignore: cast_nullable_to_non_nullable
              as Income?,
      savedTransfer: freezed == savedTransfer
          ? _value.savedTransfer
          : savedTransfer // ignore: cast_nullable_to_non_nullable
              as Transfer?,
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>,
      currencies: null == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<Currency>,
      expenseCategories: null == expenseCategories
          ? _value.expenseCategories
          : expenseCategories // ignore: cast_nullable_to_non_nullable
              as List<ExpenseCategory>,
      incomeCategories: null == incomeCategories
          ? _value.incomeCategories
          : incomeCategories // ignore: cast_nullable_to_non_nullable
              as List<IncomeCategory>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionFormStateImplCopyWith<$Res>
    implements $TransactionFormStateCopyWith<$Res> {
  factory _$$TransactionFormStateImplCopyWith(_$TransactionFormStateImpl value,
          $Res Function(_$TransactionFormStateImpl) then) =
      __$$TransactionFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Expense? savedExpense,
      Income? savedIncome,
      Transfer? savedTransfer,
      List<Account> accounts,
      List<Currency> currencies,
      List<ExpenseCategory> expenseCategories,
      List<IncomeCategory> incomeCategories,
      bool isLoading,
      bool isSaving,
      Exception? error});
}

/// @nodoc
class __$$TransactionFormStateImplCopyWithImpl<$Res>
    extends _$TransactionFormStateCopyWithImpl<$Res, _$TransactionFormStateImpl>
    implements _$$TransactionFormStateImplCopyWith<$Res> {
  __$$TransactionFormStateImplCopyWithImpl(_$TransactionFormStateImpl _value,
      $Res Function(_$TransactionFormStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savedExpense = freezed,
    Object? savedIncome = freezed,
    Object? savedTransfer = freezed,
    Object? accounts = null,
    Object? currencies = null,
    Object? expenseCategories = null,
    Object? incomeCategories = null,
    Object? isLoading = null,
    Object? isSaving = null,
    Object? error = freezed,
  }) {
    return _then(_$TransactionFormStateImpl(
      savedExpense: freezed == savedExpense
          ? _value.savedExpense
          : savedExpense // ignore: cast_nullable_to_non_nullable
              as Expense?,
      savedIncome: freezed == savedIncome
          ? _value.savedIncome
          : savedIncome // ignore: cast_nullable_to_non_nullable
              as Income?,
      savedTransfer: freezed == savedTransfer
          ? _value.savedTransfer
          : savedTransfer // ignore: cast_nullable_to_non_nullable
              as Transfer?,
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>,
      currencies: null == currencies
          ? _value._currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<Currency>,
      expenseCategories: null == expenseCategories
          ? _value._expenseCategories
          : expenseCategories // ignore: cast_nullable_to_non_nullable
              as List<ExpenseCategory>,
      incomeCategories: null == incomeCategories
          ? _value._incomeCategories
          : incomeCategories // ignore: cast_nullable_to_non_nullable
              as List<IncomeCategory>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$TransactionFormStateImpl implements _TransactionFormState {
  const _$TransactionFormStateImpl(
      {this.savedExpense,
      this.savedIncome,
      this.savedTransfer,
      final List<Account> accounts = const [],
      final List<Currency> currencies = const [],
      final List<ExpenseCategory> expenseCategories = const [],
      final List<IncomeCategory> incomeCategories = const [],
      this.isLoading = false,
      this.isSaving = false,
      this.error})
      : _accounts = accounts,
        _currencies = currencies,
        _expenseCategories = expenseCategories,
        _incomeCategories = incomeCategories;

  @override
  final Expense? savedExpense;
  @override
  final Income? savedIncome;
  @override
  final Transfer? savedTransfer;
  final List<Account> _accounts;
  @override
  @JsonKey()
  List<Account> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  final List<Currency> _currencies;
  @override
  @JsonKey()
  List<Currency> get currencies {
    if (_currencies is EqualUnmodifiableListView) return _currencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currencies);
  }

  final List<ExpenseCategory> _expenseCategories;
  @override
  @JsonKey()
  List<ExpenseCategory> get expenseCategories {
    if (_expenseCategories is EqualUnmodifiableListView)
      return _expenseCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenseCategories);
  }

  final List<IncomeCategory> _incomeCategories;
  @override
  @JsonKey()
  List<IncomeCategory> get incomeCategories {
    if (_incomeCategories is EqualUnmodifiableListView)
      return _incomeCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incomeCategories);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSaving;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'TransactionFormState(savedExpense: $savedExpense, savedIncome: $savedIncome, savedTransfer: $savedTransfer, accounts: $accounts, currencies: $currencies, expenseCategories: $expenseCategories, incomeCategories: $incomeCategories, isLoading: $isLoading, isSaving: $isSaving, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionFormStateImpl &&
            const DeepCollectionEquality()
                .equals(other.savedExpense, savedExpense) &&
            const DeepCollectionEquality()
                .equals(other.savedIncome, savedIncome) &&
            const DeepCollectionEquality()
                .equals(other.savedTransfer, savedTransfer) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            const DeepCollectionEquality()
                .equals(other._currencies, _currencies) &&
            const DeepCollectionEquality()
                .equals(other._expenseCategories, _expenseCategories) &&
            const DeepCollectionEquality()
                .equals(other._incomeCategories, _incomeCategories) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(savedExpense),
      const DeepCollectionEquality().hash(savedIncome),
      const DeepCollectionEquality().hash(savedTransfer),
      const DeepCollectionEquality().hash(_accounts),
      const DeepCollectionEquality().hash(_currencies),
      const DeepCollectionEquality().hash(_expenseCategories),
      const DeepCollectionEquality().hash(_incomeCategories),
      isLoading,
      isSaving,
      error);

  /// Create a copy of TransactionFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionFormStateImplCopyWith<_$TransactionFormStateImpl>
      get copyWith =>
          __$$TransactionFormStateImplCopyWithImpl<_$TransactionFormStateImpl>(
              this, _$identity);
}

abstract class _TransactionFormState implements TransactionFormState {
  const factory _TransactionFormState(
      {final Expense? savedExpense,
      final Income? savedIncome,
      final Transfer? savedTransfer,
      final List<Account> accounts,
      final List<Currency> currencies,
      final List<ExpenseCategory> expenseCategories,
      final List<IncomeCategory> incomeCategories,
      final bool isLoading,
      final bool isSaving,
      final Exception? error}) = _$TransactionFormStateImpl;

  @override
  Expense? get savedExpense;
  @override
  Income? get savedIncome;
  @override
  Transfer? get savedTransfer;
  @override
  List<Account> get accounts;
  @override
  List<Currency> get currencies;
  @override
  List<ExpenseCategory> get expenseCategories;
  @override
  List<IncomeCategory> get incomeCategories;
  @override
  bool get isLoading;
  @override
  bool get isSaving;
  @override
  Exception? get error;

  /// Create a copy of TransactionFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionFormStateImplCopyWith<_$TransactionFormStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
