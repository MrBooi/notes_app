import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes_ddd_app/domain/auth/auth_failure.dart';
import 'package:notes_ddd_app/domain/auth/i_auth_facade.dart';
import 'package:notes_ddd_app/domain/auth/value_objects.dart';

class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthFacade(this._firebaseAuth, this._googleSignIn);

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {@required EmailAddress emailAdrdress,
      @required Password password}) async {
    try {
      final emailAddressStr = emailAdrdress.getOrCrash();
      final passwordStr = password.getOrCrash();
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddressStr,
        password: passwordStr,
      );

      return right(unit);
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_WRONG_PASSWORD' ||
          e.code == 'ERROR_USER_NOT_FOUND') {
        return Left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return Left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {@required EmailAddress emailAdrdress,
      @required Password password}) async {
    try {
      final emailAddressStr = emailAdrdress.getOrCrash();
      final passwordStr = password.getOrCrash();
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAddressStr,
        password: passwordStr,
      );

      return right(unit);
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return Left(const AuthFailure.emailAlreadyInUse());
      } else {
        return Left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return Left(const AuthFailure.cancelledByUser());
      }
      final googleAuthentication = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );
      _firebaseAuth.signInWithCredential(authCredential);
      return Right(unit);
    } on PlatformException catch (_) {
      return Left(const AuthFailure.serverError());
    }
  }
}
