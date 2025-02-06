// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionListEventCopyWith<$Res> {
  factory $TransactionListEventCopyWith(TransactionListEvent value,
          $Res Function(TransactionListEvent) then) =
      _$TransactionListEventCopyWithImpl<$Res, TransactionListEvent>;
}

/// @nodoc
class _$TransactionListEventCopyWithImpl<$Res,
        $Val extends TransactionListEvent>
    implements $TransactionListEventCopyWith<$Res> {
  _$TransactionListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionListEvent
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
    extends _$TransactionListEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'TransactionListEvent.started()';
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
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
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
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements TransactionListEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
mixin _$TransactionListState {
  List<PopulatedExpense> get expenses => throw _privateConstructorUsedError;
  List<PopulatedIncome> get incomes => throw _privateConstructorUsedError;
  List<PopulatedTransfer> get transfers => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  /// Create a copy of TransactionListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionListStateCopyWith<TransactionListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionListStateCopyWith<$Res> {
  factory $TransactionListStateCopyWith(TransactionListState value,
          $Res Function(TransactionListState) then) =
      _$TransactionListStateCopyWithImpl<$Res, TransactionListState>;
  @useResult
  $Res call(
      {List<PopulatedExpense> expenses,
      List<PopulatedIncome> incomes,
      List<PopulatedTransfer> transfers,
      bool isLoading,
      Exception? error});
}

/// @nodoc
class _$TransactionListStateCopyWithImpl<$Res,
        $Val extends TransactionListState>
    implements $TransactionListStateCopyWith<$Res> {
  _$TransactionListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenses = null,
    Object? incomes = null,
    Object? transfers = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      expenses: null == expenses
          ? _value.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<PopulatedExpense>,
      incomes: null == incomes
          ? _value.incomes
          : incomes // ignore: cast_nullable_to_non_nullable
              as List<PopulatedIncome>,
      transfers: null == transfers
          ? _value.transfers
          : transfers // ignore: cast_nullable_to_non_nullable
              as List<PopulatedTransfer>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionListStateImplCopyWith<$Res>
    implements $TransactionListStateCopyWith<$Res> {
  factory _$$TransactionListStateImplCopyWith(_$TransactionListStateImpl value,
          $Res Function(_$TransactionListStateImpl) then) =
      __$$TransactionListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PopulatedExpense> expenses,
      List<PopulatedIncome> incomes,
      List<PopulatedTransfer> transfers,
      bool isLoading,
      Exception? error});
}

/// @nodoc
class __$$TransactionListStateImplCopyWithImpl<$Res>
    extends _$TransactionListStateCopyWithImpl<$Res, _$TransactionListStateImpl>
    implements _$$TransactionListStateImplCopyWith<$Res> {
  __$$TransactionListStateImplCopyWithImpl(_$TransactionListStateImpl _value,
      $Res Function(_$TransactionListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenses = null,
    Object? incomes = null,
    Object? transfers = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$TransactionListStateImpl(
      expenses: null == expenses
          ? _value._expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<PopulatedExpense>,
      incomes: null == incomes
          ? _value._incomes
          : incomes // ignore: cast_nullable_to_non_nullable
              as List<PopulatedIncome>,
      transfers: null == transfers
          ? _value._transfers
          : transfers // ignore: cast_nullable_to_non_nullable
              as List<PopulatedTransfer>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$TransactionListStateImpl implements _TransactionListState {
  const _$TransactionListStateImpl(
      {final List<PopulatedExpense> expenses = const [],
      final List<PopulatedIncome> incomes = const [],
      final List<PopulatedTransfer> transfers = const [],
      this.isLoading = false,
      this.error})
      : _expenses = expenses,
        _incomes = incomes,
        _transfers = transfers;

  final List<PopulatedExpense> _expenses;
  @override
  @JsonKey()
  List<PopulatedExpense> get expenses {
    if (_expenses is EqualUnmodifiableListView) return _expenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenses);
  }

  final List<PopulatedIncome> _incomes;
  @override
  @JsonKey()
  List<PopulatedIncome> get incomes {
    if (_incomes is EqualUnmodifiableListView) return _incomes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incomes);
  }

  final List<PopulatedTransfer> _transfers;
  @override
  @JsonKey()
  List<PopulatedTransfer> get transfers {
    if (_transfers is EqualUnmodifiableListView) return _transfers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transfers);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'TransactionListState(expenses: $expenses, incomes: $incomes, transfers: $transfers, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionListStateImpl &&
            const DeepCollectionEquality().equals(other._expenses, _expenses) &&
            const DeepCollectionEquality().equals(other._incomes, _incomes) &&
            const DeepCollectionEquality()
                .equals(other._transfers, _transfers) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_expenses),
      const DeepCollectionEquality().hash(_incomes),
      const DeepCollectionEquality().hash(_transfers),
      isLoading,
      error);

  /// Create a copy of TransactionListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionListStateImplCopyWith<_$TransactionListStateImpl>
      get copyWith =>
          __$$TransactionListStateImplCopyWithImpl<_$TransactionListStateImpl>(
              this, _$identity);
}

abstract class _TransactionListState implements TransactionListState {
  const factory _TransactionListState(
      {final List<PopulatedExpense> expenses,
      final List<PopulatedIncome> incomes,
      final List<PopulatedTransfer> transfers,
      final bool isLoading,
      final Exception? error}) = _$TransactionListStateImpl;

  @override
  List<PopulatedExpense> get expenses;
  @override
  List<PopulatedIncome> get incomes;
  @override
  List<PopulatedTransfer> get transfers;
  @override
  bool get isLoading;
  @override
  Exception? get error;

  /// Create a copy of TransactionListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionListStateImplCopyWith<_$TransactionListStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
