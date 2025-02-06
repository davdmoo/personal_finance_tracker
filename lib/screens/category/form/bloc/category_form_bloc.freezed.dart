// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String name, String? description) formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name, String? description)? formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name, String? description)? formSubmitted,
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
abstract class $CategoryFormEventCopyWith<$Res> {
  factory $CategoryFormEventCopyWith(
          CategoryFormEvent value, $Res Function(CategoryFormEvent) then) =
      _$CategoryFormEventCopyWithImpl<$Res, CategoryFormEvent>;
}

/// @nodoc
class _$CategoryFormEventCopyWithImpl<$Res, $Val extends CategoryFormEvent>
    implements $CategoryFormEventCopyWith<$Res> {
  _$CategoryFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryFormEvent
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
    extends _$CategoryFormEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryFormEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'CategoryFormEvent.started()';
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
    required TResult Function(String name, String? description) formSubmitted,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name, String? description)? formSubmitted,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name, String? description)? formSubmitted,
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

abstract class _Started implements CategoryFormEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$FormSubmittedImplCopyWith<$Res> {
  factory _$$FormSubmittedImplCopyWith(
          _$FormSubmittedImpl value, $Res Function(_$FormSubmittedImpl) then) =
      __$$FormSubmittedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String? description});
}

/// @nodoc
class __$$FormSubmittedImplCopyWithImpl<$Res>
    extends _$CategoryFormEventCopyWithImpl<$Res, _$FormSubmittedImpl>
    implements _$$FormSubmittedImplCopyWith<$Res> {
  __$$FormSubmittedImplCopyWithImpl(
      _$FormSubmittedImpl _value, $Res Function(_$FormSubmittedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_$FormSubmittedImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FormSubmittedImpl implements _FormSubmitted {
  const _$FormSubmittedImpl({required this.name, this.description});

  @override
  final String name;
  @override
  final String? description;

  @override
  String toString() {
    return 'CategoryFormEvent.formSubmitted(name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormSubmittedImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, description);

  /// Create a copy of CategoryFormEvent
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
    required TResult Function(String name, String? description) formSubmitted,
  }) {
    return formSubmitted(name, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String name, String? description)? formSubmitted,
  }) {
    return formSubmitted?.call(name, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String name, String? description)? formSubmitted,
    required TResult orElse(),
  }) {
    if (formSubmitted != null) {
      return formSubmitted(name, description);
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

abstract class _FormSubmitted implements CategoryFormEvent {
  const factory _FormSubmitted(
      {required final String name,
      final String? description}) = _$FormSubmittedImpl;

  String get name;
  String? get description;

  /// Create a copy of CategoryFormEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormSubmittedImplCopyWith<_$FormSubmittedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategoryFormState {
  ExpenseCategory? get expenseCategory => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  /// Create a copy of CategoryFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryFormStateCopyWith<CategoryFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryFormStateCopyWith<$Res> {
  factory $CategoryFormStateCopyWith(
          CategoryFormState value, $Res Function(CategoryFormState) then) =
      _$CategoryFormStateCopyWithImpl<$Res, CategoryFormState>;
  @useResult
  $Res call(
      {ExpenseCategory? expenseCategory, bool isLoading, Exception? error});
}

/// @nodoc
class _$CategoryFormStateCopyWithImpl<$Res, $Val extends CategoryFormState>
    implements $CategoryFormStateCopyWith<$Res> {
  _$CategoryFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseCategory = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      expenseCategory: freezed == expenseCategory
          ? _value.expenseCategory
          : expenseCategory // ignore: cast_nullable_to_non_nullable
              as ExpenseCategory?,
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
abstract class _$$CategoryFormStateImplCopyWith<$Res>
    implements $CategoryFormStateCopyWith<$Res> {
  factory _$$CategoryFormStateImplCopyWith(_$CategoryFormStateImpl value,
          $Res Function(_$CategoryFormStateImpl) then) =
      __$$CategoryFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ExpenseCategory? expenseCategory, bool isLoading, Exception? error});
}

/// @nodoc
class __$$CategoryFormStateImplCopyWithImpl<$Res>
    extends _$CategoryFormStateCopyWithImpl<$Res, _$CategoryFormStateImpl>
    implements _$$CategoryFormStateImplCopyWith<$Res> {
  __$$CategoryFormStateImplCopyWithImpl(_$CategoryFormStateImpl _value,
      $Res Function(_$CategoryFormStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseCategory = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$CategoryFormStateImpl(
      expenseCategory: freezed == expenseCategory
          ? _value.expenseCategory
          : expenseCategory // ignore: cast_nullable_to_non_nullable
              as ExpenseCategory?,
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

class _$CategoryFormStateImpl implements _CategoryFormState {
  const _$CategoryFormStateImpl(
      {this.expenseCategory, this.isLoading = false, this.error});

  @override
  final ExpenseCategory? expenseCategory;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'CategoryFormState(expenseCategory: $expenseCategory, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryFormStateImpl &&
            const DeepCollectionEquality()
                .equals(other.expenseCategory, expenseCategory) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(expenseCategory), isLoading, error);

  /// Create a copy of CategoryFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryFormStateImplCopyWith<_$CategoryFormStateImpl> get copyWith =>
      __$$CategoryFormStateImplCopyWithImpl<_$CategoryFormStateImpl>(
          this, _$identity);
}

abstract class _CategoryFormState implements CategoryFormState {
  const factory _CategoryFormState(
      {final ExpenseCategory? expenseCategory,
      final bool isLoading,
      final Exception? error}) = _$CategoryFormStateImpl;

  @override
  ExpenseCategory? get expenseCategory;
  @override
  bool get isLoading;
  @override
  Exception? get error;

  /// Create a copy of CategoryFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryFormStateImplCopyWith<_$CategoryFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
