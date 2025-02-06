// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountEvent {
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
abstract class $AccountEventCopyWith<$Res> {
  factory $AccountEventCopyWith(
          AccountEvent value, $Res Function(AccountEvent) then) =
      _$AccountEventCopyWithImpl<$Res, AccountEvent>;
}

/// @nodoc
class _$AccountEventCopyWithImpl<$Res, $Val extends AccountEvent>
    implements $AccountEventCopyWith<$Res> {
  _$AccountEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountEvent
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
    extends _$AccountEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'AccountEvent.started()';
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

abstract class _Started implements AccountEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
mixin _$AccountState {
  List<Account> get accounts => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountStateCopyWith<AccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res, AccountState>;
  @useResult
  $Res call({List<Account> accounts, bool isLoading, Exception? error});
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res, $Val extends AccountState>
    implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>,
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
abstract class _$$AccountStateImplCopyWith<$Res>
    implements $AccountStateCopyWith<$Res> {
  factory _$$AccountStateImplCopyWith(
          _$AccountStateImpl value, $Res Function(_$AccountStateImpl) then) =
      __$$AccountStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Account> accounts, bool isLoading, Exception? error});
}

/// @nodoc
class __$$AccountStateImplCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccountStateImpl>
    implements _$$AccountStateImplCopyWith<$Res> {
  __$$AccountStateImplCopyWithImpl(
      _$AccountStateImpl _value, $Res Function(_$AccountStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$AccountStateImpl(
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>,
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

class _$AccountStateImpl implements _AccountState {
  const _$AccountStateImpl(
      {final List<Account> accounts = const [],
      this.isLoading = false,
      this.error})
      : _accounts = accounts;

  final List<Account> _accounts;
  @override
  @JsonKey()
  List<Account> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'AccountState(accounts: $accounts, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountStateImpl &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_accounts), isLoading, error);

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountStateImplCopyWith<_$AccountStateImpl> get copyWith =>
      __$$AccountStateImplCopyWithImpl<_$AccountStateImpl>(this, _$identity);
}

abstract class _AccountState implements AccountState {
  const factory _AccountState(
      {final List<Account> accounts,
      final bool isLoading,
      final Exception? error}) = _$AccountStateImpl;

  @override
  List<Account> get accounts;
  @override
  bool get isLoading;
  @override
  Exception? get error;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountStateImplCopyWith<_$AccountStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
