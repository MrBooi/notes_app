import 'package:dartz/dartz.dart';
import 'package:notes_ddd_app/domain/core/failures.dart';

import 'package:notes_ddd_app/domain/core/value_objects.dart';
import 'package:notes_ddd_app/domain/core/value_validators.dart';

class EmailAdrdress extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory EmailAdrdress(String input) {
    assert(input != null);
    return EmailAdrdress._(
      validateEmailAddress(input),
    );
  }

  const EmailAdrdress._(this.value);
}

class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    assert(input != null);
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}