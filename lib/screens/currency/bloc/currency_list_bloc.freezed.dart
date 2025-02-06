// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurrencyListEvent {
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
abstract class $CurrencyListEventCopyWith<$Res> {
  factory $CurrencyListEventCopyWith(
          CurrencyListEvent value, $Res Function(CurrencyListEvent) then) =
      _$CurrencyListEventCopyWithImpl<$Res, CurrencyListEvent>;
}

/// @nodoc
class _$CurrencyListEventCopyWithImpl<$Res, $Val extends CurrencyListEvent>
    implements $CurrencyListEventCopyWith<$Res> {
  _$CurrencyListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyListEvent
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
    extends _$CurrencyListEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'CurrencyListEvent.started()';
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

abstract class _Started implements CurrencyListEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
mixin _$CurrencyListState {
  List<Currency> get currencies => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  /// Create a copy of CurrencyListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyListStateCopyWith<CurrencyListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyListStateCopyWith<$Res> {
  factory $CurrencyListStateCopyWith(
          CurrencyListState value, $Res Function(CurrencyListState) then) =
      _$CurrencyListStateCopyWithImpl<$Res, CurrencyListState>;
  @useResult
  $Res call({List<Currency> currencies, bool isLoading, Exception? error});
}

/// @nodoc
class _$CurrencyListStateCopyWithImpl<$Res, $Val extends CurrencyListState>
    implements $CurrencyListStateCopyWith<$Res> {
  _$CurrencyListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencies = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      currencies: null == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<Currency>,
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
abstract class _$$CurrencyListStateImplCopyWith<$Res>
    implements $CurrencyListStateCopyWith<$Res> {
  factory _$$CurrencyListStateImplCopyWith(_$CurrencyListStateImpl value,
          $Res Function(_$CurrencyListStateImpl) then) =
      __$$CurrencyListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Currency> currencies, bool isLoading, Exception? error});
}

/// @nodoc
class __$$CurrencyListStateImplCopyWithImpl<$Res>
    extends _$CurrencyListStateCopyWithImpl<$Res, _$CurrencyListStateImpl>
    implements _$$CurrencyListStateImplCopyWith<$Res> {
  __$$CurrencyListStateImplCopyWithImpl(_$CurrencyListStateImpl _value,
      $Res Function(_$CurrencyListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencies = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$CurrencyListStateImpl(
      currencies: null == currencies
          ? _value._currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<Currency>,
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

class _$CurrencyListStateImpl implements _CurrencyListState {
  const _$CurrencyListStateImpl(
      {final List<Currency> currencies = const [],
      this.isLoading = false,
      this.error})
      : _currencies = currencies;

  final List<Currency> _currencies;
  @override
  @JsonKey()
  List<Currency> get currencies {
    if (_currencies is EqualUnmodifiableListView) return _currencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currencies);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'CurrencyListState(currencies: $currencies, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyListStateImpl &&
            const DeepCollectionEquality()
                .equals(other._currencies, _currencies) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_currencies), isLoading, error);

  /// Create a copy of CurrencyListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyListStateImplCopyWith<_$CurrencyListStateImpl> get copyWith =>
      __$$CurrencyListStateImplCopyWithImpl<_$CurrencyListStateImpl>(
          this, _$identity);
}

abstract class _CurrencyListState implements CurrencyListState {
  const factory _CurrencyListState(
      {final List<Currency> currencies,
      final bool isLoading,
      final Exception? error}) = _$CurrencyListStateImpl;

  @override
  List<Currency> get currencies;
  @override
  bool get isLoading;
  @override
  Exception? get error;

  /// Create a copy of CurrencyListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyListStateImplCopyWith<_$CurrencyListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
