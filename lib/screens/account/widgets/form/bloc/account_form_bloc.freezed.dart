// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String name, AccountGroup accountGroup)
        formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name, AccountGroup accountGroup)? formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name, AccountGroup accountGroup)? formSubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FormSubmitted value) formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FormSubmitted value)? formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FormSubmitted value)? formSubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountFormEventCopyWith<$Res> {
  factory $AccountFormEventCopyWith(
          AccountFormEvent value, $Res Function(AccountFormEvent) then) =
      _$AccountFormEventCopyWithImpl<$Res, AccountFormEvent>;
}

/// @nodoc
class _$AccountFormEventCopyWithImpl<$Res, $Val extends AccountFormEvent>
    implements $AccountFormEventCopyWith<$Res> {
  _$AccountFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountFormEvent
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
    extends _$AccountFormEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountFormEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'AccountFormEvent.started()';
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
    required TResult Function(String name, AccountGroup accountGroup)
        formSubmitted,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name, AccountGroup accountGroup)? formSubmitted,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name, AccountGroup accountGroup)? formSubmitted,
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
    required TResult Function(_FormSubmitted value) formSubmitted,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FormSubmitted value)? formSubmitted,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FormSubmitted value)? formSubmitted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements AccountFormEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$FormSubmittedImplCopyWith<$Res> {
  factory _$$FormSubmittedImplCopyWith(
          _$FormSubmittedImpl value, $Res Function(_$FormSubmittedImpl) then) =
      __$$FormSubmittedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, AccountGroup accountGroup});
}

/// @nodoc
class __$$FormSubmittedImplCopyWithImpl<$Res>
    extends _$AccountFormEventCopyWithImpl<$Res, _$FormSubmittedImpl>
    implements _$$FormSubmittedImplCopyWith<$Res> {
  __$$FormSubmittedImplCopyWithImpl(
      _$FormSubmittedImpl _value, $Res Function(_$FormSubmittedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? accountGroup = freezed,
  }) {
    return _then(_$FormSubmittedImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      accountGroup: freezed == accountGroup
          ? _value.accountGroup
          : accountGroup // ignore: cast_nullable_to_non_nullable
              as AccountGroup,
    ));
  }
}

/// @nodoc

class _$FormSubmittedImpl implements _FormSubmitted {
  const _$FormSubmittedImpl({required this.name, required this.accountGroup});

  @override
  final String name;
  @override
  final AccountGroup accountGroup;

  @override
  String toString() {
    return 'AccountFormEvent.formSubmitted(name: $name, accountGroup: $accountGroup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormSubmittedImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other.accountGroup, accountGroup));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(accountGroup));

  /// Create a copy of AccountFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormSubmittedImplCopyWith<_$FormSubmittedImpl> get copyWith =>
      __$$FormSubmittedImplCopyWithImpl<_$FormSubmittedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String name, AccountGroup accountGroup)
        formSubmitted,
  }) {
    return formSubmitted(name, accountGroup);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name, AccountGroup accountGroup)? formSubmitted,
  }) {
    return formSubmitted?.call(name, accountGroup);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name, AccountGroup accountGroup)? formSubmitted,
    required TResult orElse(),
  }) {
    if (formSubmitted != null) {
      return formSubmitted(name, accountGroup);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FormSubmitted value) formSubmitted,
  }) {
    return formSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FormSubmitted value)? formSubmitted,
  }) {
    return formSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FormSubmitted value)? formSubmitted,
    required TResult orElse(),
  }) {
    if (formSubmitted != null) {
      return formSubmitted(this);
    }
    return orElse();
  }
}

abstract class _FormSubmitted implements AccountFormEvent {
  const factory _FormSubmitted(
      {required final String name,
      required final AccountGroup accountGroup}) = _$FormSubmittedImpl;

  String get name;
  AccountGroup get accountGroup;

  /// Create a copy of AccountFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormSubmittedImplCopyWith<_$FormSubmittedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AccountFormState {
  Account? get savedAccount => throw _privateConstructorUsedError;
  List<AccountGroup> get accountGroups => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  /// Create a copy of AccountFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountFormStateCopyWith<AccountFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountFormStateCopyWith<$Res> {
  factory $AccountFormStateCopyWith(
          AccountFormState value, $Res Function(AccountFormState) then) =
      _$AccountFormStateCopyWithImpl<$Res, AccountFormState>;
  @useResult
  $Res call(
      {Account? savedAccount,
      List<AccountGroup> accountGroups,
      bool isLoading,
      bool isSaving,
      Exception? error});
}

/// @nodoc
class _$AccountFormStateCopyWithImpl<$Res, $Val extends AccountFormState>
    implements $AccountFormStateCopyWith<$Res> {
  _$AccountFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savedAccount = freezed,
    Object? accountGroups = null,
    Object? isLoading = null,
    Object? isSaving = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      savedAccount: freezed == savedAccount
          ? _value.savedAccount
          : savedAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
      accountGroups: null == accountGroups
          ? _value.accountGroups
          : accountGroups // ignore: cast_nullable_to_non_nullable
              as List<AccountGroup>,
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
abstract class _$$AccountFormStateImplCopyWith<$Res>
    implements $AccountFormStateCopyWith<$Res> {
  factory _$$AccountFormStateImplCopyWith(_$AccountFormStateImpl value,
          $Res Function(_$AccountFormStateImpl) then) =
      __$$AccountFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Account? savedAccount,
      List<AccountGroup> accountGroups,
      bool isLoading,
      bool isSaving,
      Exception? error});
}

/// @nodoc
class __$$AccountFormStateImplCopyWithImpl<$Res>
    extends _$AccountFormStateCopyWithImpl<$Res, _$AccountFormStateImpl>
    implements _$$AccountFormStateImplCopyWith<$Res> {
  __$$AccountFormStateImplCopyWithImpl(_$AccountFormStateImpl _value,
      $Res Function(_$AccountFormStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savedAccount = freezed,
    Object? accountGroups = null,
    Object? isLoading = null,
    Object? isSaving = null,
    Object? error = freezed,
  }) {
    return _then(_$AccountFormStateImpl(
      savedAccount: freezed == savedAccount
          ? _value.savedAccount
          : savedAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
      accountGroups: null == accountGroups
          ? _value._accountGroups
          : accountGroups // ignore: cast_nullable_to_non_nullable
              as List<AccountGroup>,
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

class _$AccountFormStateImpl implements _AccountFormState {
  const _$AccountFormStateImpl(
      {this.savedAccount,
      final List<AccountGroup> accountGroups = const [],
      this.isLoading = false,
      this.isSaving = false,
      this.error})
      : _accountGroups = accountGroups;

  @override
  final Account? savedAccount;
  final List<AccountGroup> _accountGroups;
  @override
  @JsonKey()
  List<AccountGroup> get accountGroups {
    if (_accountGroups is EqualUnmodifiableListView) return _accountGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accountGroups);
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
    return 'AccountFormState(savedAccount: $savedAccount, accountGroups: $accountGroups, isLoading: $isLoading, isSaving: $isSaving, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountFormStateImpl &&
            const DeepCollectionEquality()
                .equals(other.savedAccount, savedAccount) &&
            const DeepCollectionEquality()
                .equals(other._accountGroups, _accountGroups) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(savedAccount),
      const DeepCollectionEquality().hash(_accountGroups),
      isLoading,
      isSaving,
      error);

  /// Create a copy of AccountFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountFormStateImplCopyWith<_$AccountFormStateImpl> get copyWith =>
      __$$AccountFormStateImplCopyWithImpl<_$AccountFormStateImpl>(
          this, _$identity);
}

abstract class _AccountFormState implements AccountFormState {
  const factory _AccountFormState(
      {final Account? savedAccount,
      final List<AccountGroup> accountGroups,
      final bool isLoading,
      final bool isSaving,
      final Exception? error}) = _$AccountFormStateImpl;

  @override
  Account? get savedAccount;
  @override
  List<AccountGroup> get accountGroups;
  @override
  bool get isLoading;
  @override
  bool get isSaving;
  @override
  Exception? get error;

  /// Create a copy of AccountFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountFormStateImplCopyWith<_$AccountFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
