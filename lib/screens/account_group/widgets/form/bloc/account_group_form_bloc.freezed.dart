// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_group_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountGroupFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String name) formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name)? formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name)? formSubmitted,
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
abstract class $AccountGroupFormEventCopyWith<$Res> {
  factory $AccountGroupFormEventCopyWith(AccountGroupFormEvent value,
          $Res Function(AccountGroupFormEvent) then) =
      _$AccountGroupFormEventCopyWithImpl<$Res, AccountGroupFormEvent>;
}

/// @nodoc
class _$AccountGroupFormEventCopyWithImpl<$Res,
        $Val extends AccountGroupFormEvent>
    implements $AccountGroupFormEventCopyWith<$Res> {
  _$AccountGroupFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountGroupFormEvent
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
    extends _$AccountGroupFormEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountGroupFormEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'AccountGroupFormEvent.started()';
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
    required TResult Function(String name) formSubmitted,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name)? formSubmitted,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name)? formSubmitted,
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

abstract class _Started implements AccountGroupFormEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$FormSubmittedImplCopyWith<$Res> {
  factory _$$FormSubmittedImplCopyWith(
          _$FormSubmittedImpl value, $Res Function(_$FormSubmittedImpl) then) =
      __$$FormSubmittedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$FormSubmittedImplCopyWithImpl<$Res>
    extends _$AccountGroupFormEventCopyWithImpl<$Res, _$FormSubmittedImpl>
    implements _$$FormSubmittedImplCopyWith<$Res> {
  __$$FormSubmittedImplCopyWithImpl(
      _$FormSubmittedImpl _value, $Res Function(_$FormSubmittedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountGroupFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$FormSubmittedImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FormSubmittedImpl implements _FormSubmitted {
  const _$FormSubmittedImpl({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'AccountGroupFormEvent.formSubmitted(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormSubmittedImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of AccountGroupFormEvent
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
    required TResult Function(String name) formSubmitted,
  }) {
    return formSubmitted(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name)? formSubmitted,
  }) {
    return formSubmitted?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name)? formSubmitted,
    required TResult orElse(),
  }) {
    if (formSubmitted != null) {
      return formSubmitted(name);
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

abstract class _FormSubmitted implements AccountGroupFormEvent {
  const factory _FormSubmitted({required final String name}) =
      _$FormSubmittedImpl;

  String get name;

  /// Create a copy of AccountGroupFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormSubmittedImplCopyWith<_$FormSubmittedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AccountGroupFormState {
  AccountGroup? get savedAccountGroup => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  /// Create a copy of AccountGroupFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountGroupFormStateCopyWith<AccountGroupFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountGroupFormStateCopyWith<$Res> {
  factory $AccountGroupFormStateCopyWith(AccountGroupFormState value,
          $Res Function(AccountGroupFormState) then) =
      _$AccountGroupFormStateCopyWithImpl<$Res, AccountGroupFormState>;
  @useResult
  $Res call(
      {AccountGroup? savedAccountGroup,
      bool isLoading,
      bool isSaving,
      Exception? error});
}

/// @nodoc
class _$AccountGroupFormStateCopyWithImpl<$Res,
        $Val extends AccountGroupFormState>
    implements $AccountGroupFormStateCopyWith<$Res> {
  _$AccountGroupFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountGroupFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savedAccountGroup = freezed,
    Object? isLoading = null,
    Object? isSaving = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      savedAccountGroup: freezed == savedAccountGroup
          ? _value.savedAccountGroup
          : savedAccountGroup // ignore: cast_nullable_to_non_nullable
              as AccountGroup?,
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
abstract class _$$AccountGroupFormStateImplCopyWith<$Res>
    implements $AccountGroupFormStateCopyWith<$Res> {
  factory _$$AccountGroupFormStateImplCopyWith(
          _$AccountGroupFormStateImpl value,
          $Res Function(_$AccountGroupFormStateImpl) then) =
      __$$AccountGroupFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AccountGroup? savedAccountGroup,
      bool isLoading,
      bool isSaving,
      Exception? error});
}

/// @nodoc
class __$$AccountGroupFormStateImplCopyWithImpl<$Res>
    extends _$AccountGroupFormStateCopyWithImpl<$Res,
        _$AccountGroupFormStateImpl>
    implements _$$AccountGroupFormStateImplCopyWith<$Res> {
  __$$AccountGroupFormStateImplCopyWithImpl(_$AccountGroupFormStateImpl _value,
      $Res Function(_$AccountGroupFormStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountGroupFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savedAccountGroup = freezed,
    Object? isLoading = null,
    Object? isSaving = null,
    Object? error = freezed,
  }) {
    return _then(_$AccountGroupFormStateImpl(
      savedAccountGroup: freezed == savedAccountGroup
          ? _value.savedAccountGroup
          : savedAccountGroup // ignore: cast_nullable_to_non_nullable
              as AccountGroup?,
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

class _$AccountGroupFormStateImpl implements _AccountGroupFormState {
  const _$AccountGroupFormStateImpl(
      {this.savedAccountGroup,
      this.isLoading = false,
      this.isSaving = false,
      this.error});

  @override
  final AccountGroup? savedAccountGroup;
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
    return 'AccountGroupFormState(savedAccountGroup: $savedAccountGroup, isLoading: $isLoading, isSaving: $isSaving, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountGroupFormStateImpl &&
            const DeepCollectionEquality()
                .equals(other.savedAccountGroup, savedAccountGroup) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(savedAccountGroup),
      isLoading,
      isSaving,
      error);

  /// Create a copy of AccountGroupFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountGroupFormStateImplCopyWith<_$AccountGroupFormStateImpl>
      get copyWith => __$$AccountGroupFormStateImplCopyWithImpl<
          _$AccountGroupFormStateImpl>(this, _$identity);
}

abstract class _AccountGroupFormState implements AccountGroupFormState {
  const factory _AccountGroupFormState(
      {final AccountGroup? savedAccountGroup,
      final bool isLoading,
      final bool isSaving,
      final Exception? error}) = _$AccountGroupFormStateImpl;

  @override
  AccountGroup? get savedAccountGroup;
  @override
  bool get isLoading;
  @override
  bool get isSaving;
  @override
  Exception? get error;

  /// Create a copy of AccountGroupFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountGroupFormStateImplCopyWith<_$AccountGroupFormStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
