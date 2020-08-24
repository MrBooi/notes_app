import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:kt_dart/collection.dart';
import 'package:notes_ddd_app/domain/core/failures.dart';
import 'package:notes_ddd_app/domain/core/value_objects.dart';
import 'package:notes_ddd_app/domain/core/value_transformers.dart';
import 'package:notes_ddd_app/domain/core/value_validators.dart';

// ignore: must_be_immutable
class NoteBody extends ValueObject<String> {
  @override
  Either<ValueFailure<String>, String> value;

  static const maxLength = 1000;

  factory NoteBody(String input) {
    assert(input != null);
    return NoteBody._(
      validateMaxStringLength(input, maxLength).flatMap(validateIsNotEmpy),
    );
  }

  NoteBody._(this.value);
}

// ignore: must_be_immutable
class TodoName extends ValueObject<String> {
  @override
  Either<ValueFailure<String>, String> value;

  static const maxLength = 30;

  factory TodoName(String input) {
    assert(input != null);
    return TodoName._(
      validateMaxStringLength(input, maxLength).flatMap(validateSingleLine),
    );
  }

  TodoName._(this.value);
}

// ignore: must_be_immutable
class NoteColor extends ValueObject<Color> {
  static const List<Color> predefinedColors = [
    Color(0xfffafafa), // canvas
    Color(0xfffa8072), // salmon
    Color(0xfffedc56), // mustard
    Color(0xffd0f0c0), // tea
    Color(0xfffca3b7), // flamingo
    Color(0xff997950), // tortilla
    Color(0xfffffdd0), // cream
  ];

  @override
  Either<ValueFailure<Color>, Color> value;

  static const maxLength = 30;

  factory NoteColor(Color input) {
    assert(input != null);
    return NoteColor._(
      right(makeColorOpaque(input)),
    );
  }

  NoteColor._(this.value);
}

class List3<T> extends ValueObject<KtList<T>> {
  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;

  static const maxLength = 3;

  factory List3(KtList<T> input) {
    assert(input != null);
    return List3._(
      validateMaxListLength(input, maxLength),
    );
  }

  const List3._(this.value);

  int get length {
    return value.getOrElse(() => emptyList()).size;
  }

  bool get isFull {
    return length == maxLength;
  }
}
