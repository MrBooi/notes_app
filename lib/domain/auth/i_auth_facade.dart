import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:notes_ddd_app/domain/auth/auth_failure.dart';
import 'value_objects.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAdrdress emailAdrdress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAdrdress emailAdrdress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
