// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'note_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$NoteFailureTearOff {
  const _$NoteFailureTearOff();

// ignore: unused_element
  _Unexpected unexpected() {
    return const _Unexpected();
  }
}

// ignore: unused_element
const $NoteFailure = _$NoteFailureTearOff();

mixin _$NoteFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpected(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpected(_Unexpected value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(_Unexpected value),
    @required Result orElse(),
  });
}

abstract class $NoteFailureCopyWith<$Res> {
  factory $NoteFailureCopyWith(
          NoteFailure value, $Res Function(NoteFailure) then) =
      _$NoteFailureCopyWithImpl<$Res>;
}

class _$NoteFailureCopyWithImpl<$Res> implements $NoteFailureCopyWith<$Res> {
  _$NoteFailureCopyWithImpl(this._value, this._then);

  final NoteFailure _value;
  // ignore: unused_field
  final $Res Function(NoteFailure) _then;
}

abstract class _$UnexpectedCopyWith<$Res> {
  factory _$UnexpectedCopyWith(
          _Unexpected value, $Res Function(_Unexpected) then) =
      __$UnexpectedCopyWithImpl<$Res>;
}

class __$UnexpectedCopyWithImpl<$Res> extends _$NoteFailureCopyWithImpl<$Res>
    implements _$UnexpectedCopyWith<$Res> {
  __$UnexpectedCopyWithImpl(
      _Unexpected _value, $Res Function(_Unexpected) _then)
      : super(_value, (v) => _then(v as _Unexpected));

  @override
  _Unexpected get _value => super._value as _Unexpected;
}

class _$_Unexpected implements _Unexpected {
  const _$_Unexpected();

  @override
  String toString() {
    return 'NoteFailure.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Unexpected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpected(),
  }) {
    assert(unexpected != null);
    return unexpected();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpected(_Unexpected value),
  }) {
    assert(unexpected != null);
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(_Unexpected value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected implements NoteFailure {
  const factory _Unexpected() = _$_Unexpected;
}
