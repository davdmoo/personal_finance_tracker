// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurrencyFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String name, String code) formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name, String code)? formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name, String code)? formSubmitted,
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
abstract class $CurrencyFormEventCopyWith<$Res> {
  factory $CurrencyFormEventCopyWith(
          CurrencyFormEvent value, $Res Function(CurrencyFormEvent) then) =
      _$CurrencyFormEventCopyWithImpl<$Res, CurrencyFormEvent>;
}

/// @nodoc
class _$CurrencyFormEventCopyWithImpl<$Res, $Val extends CurrencyFormEvent>
    implements $CurrencyFormEventCopyWith<$Res> {
  _$CurrencyFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyFormEvent
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
    extends _$CurrencyFormEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyFormEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'CurrencyFormEvent.started()';
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
    required TResult Function(String name, String code) formSubmitted,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name, String code)? formSubmitted,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name, String code)? formSubmitted,
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

abstract class _Started implements CurrencyFormEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$FormSubmittedImplCopyWith<$Res> {
  factory _$$FormSubmittedImplCopyWith(
          _$FormSubmittedImpl value, $Res Function(_$FormSubmittedImpl) then) =
      __$$FormSubmittedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$FormSubmittedImplCopyWithImpl<$Res>
    extends _$CurrencyFormEventCopyWithImpl<$Res, _$FormSubmittedImpl>
    implements _$$FormSubmittedImplCopyWith<$Res> {
  __$$FormSubmittedImplCopyWithImpl(
      _$FormSubmittedImpl _value, $Res Function(_$FormSubmittedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$FormSubmittedImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FormSubmittedImpl implements _FormSubmitted {
  const _$FormSubmittedImpl({required this.name, required this.code});

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'CurrencyFormEvent.formSubmitted(name: $name, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormSubmittedImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  /// Create a copy of CurrencyFormEvent
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
    required TResult Function(String name, String code) formSubmitted,
  }) {
    return formSubmitted(name, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name, String code)? formSubmitted,
  }) {
    return formSubmitted?.call(name, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name, String code)? formSubmitted,
    required TResult orElse(),
  }) {
    if (formSubmitted != null) {
      return formSubmitted(name, code);
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

abstract class _FormSubmitted implements CurrencyFormEvent {
  const factory _FormSubmitted(
      {required final String name,
      required final String code}) = _$FormSubmittedImpl;

  String get name;
  String get code;

  /// Create a copy of CurrencyFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormSubmittedImplCopyWith<_$FormSubmittedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CurrencyFormState {
  Currency? get savedCurrency => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  /// Create a copy of CurrencyFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyFormStateCopyWith<CurrencyFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyFormStateCopyWith<$Res> {
  factory $CurrencyFormStateCopyWith(
          CurrencyFormState value, $Res Function(CurrencyFormState) then) =
      _$CurrencyFormStateCopyWithImpl<$Res, CurrencyFormState>;
  @useResult
  $Res call(
      {Currency? savedCurrency,
      bool isLoading,
      bool isSaving,
      Exception? error});
}

/// @nodoc
class _$CurrencyFormStateCopyWithImpl<$Res, $Val extends CurrencyFormState>
    implements $CurrencyFormStateCopyWith<$Res> {
  _$CurrencyFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savedCurrency = freezed,
    Object? isLoading = null,
    Object? isSaving = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      savedCurrency: freezed == savedCurrency
          ? _value.savedCurrency
          : savedCurrency // ignore: cast_nullable_to_non_nullable
              as Currency?,
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
abstract class _$$CurrencyFormStateImplCopyWith<$Res>
    implements $CurrencyFormStateCopyWith<$Res> {
  factory _$$CurrencyFormStateImplCopyWith(_$CurrencyFormStateImpl value,
          $Res Function(_$CurrencyFormStateImpl) then) =
      __$$CurrencyFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Currency? savedCurrency,
      bool isLoading,
      bool isSaving,
      Exception? error});
}

/// @nodoc
class __$$CurrencyFormStateImplCopyWithImpl<$Res>
    extends _$CurrencyFormStateCopyWithImpl<$Res, _$CurrencyFormStateImpl>
    implements _$$CurrencyFormStateImplCopyWith<$Res> {
  __$$CurrencyFormStateImplCopyWithImpl(_$CurrencyFormStateImpl _value,
      $Res Function(_$CurrencyFormStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savedCurrency = freezed,
    Object? isLoading = null,
    Object? isSaving = null,
    Object? error = freezed,
  }) {
    return _then(_$CurrencyFormStateImpl(
      savedCurrency: freezed == savedCurrency
          ? _value.savedCurrency
          : savedCurrency // ignore: cast_nullable_to_non_nullable
              as Currency?,
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

class _$CurrencyFormStateImpl implements _CurrencyFormState {
  const _$CurrencyFormStateImpl(
      {this.savedCurrency,
      this.isLoading = false,
      this.isSaving = false,
      this.error});

  @override
  final Currency? savedCurrency;
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
    return 'CurrencyFormState(savedCurrency: $savedCurrency, isLoading: $isLoading, isSaving: $isSaving, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyFormStateImpl &&
            const DeepCollectionEquality()
                .equals(other.savedCurrency, savedCurrency) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(savedCurrency),
      isLoading,
      isSaving,
      error);

  /// Create a copy of CurrencyFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyFormStateImplCopyWith<_$CurrencyFormStateImpl> get copyWith =>
      __$$CurrencyFormStateImplCopyWithImpl<_$CurrencyFormStateImpl>(
          this, _$identity);
}

abstract class _CurrencyFormState implements CurrencyFormState {
  const factory _CurrencyFormState(
      {final Currency? savedCurrency,
      final bool isLoading,
      final bool isSaving,
      final Exception? error}) = _$CurrencyFormStateImpl;

  @override
  Currency? get savedCurrency;
  @override
  bool get isLoading;
  @override
  bool get isSaving;
  @override
  Exception? get error;

  /// Create a copy of CurrencyFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyFormStateImplCopyWith<_$CurrencyFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
