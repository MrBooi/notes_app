import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:notes_ddd_app/domain/auth/auth_failure.dart';
import 'package:notes_ddd_app/domain/auth/i_auth_facade.dart';
import 'package:notes_ddd_app/domain/auth/value_objects.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  // ignore: unused_field
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial());

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    yield* event.map(emailChanged: (e) async* {
      yield state.copyWith(
        emailAddress: EmailAddress(e.email),
        authFailureOrSuccessOption: none(),
      );
    }, passwordChanged: (e) async* {
      yield state.copyWith.call(
        password: Password(e.password),
        authFailureOrSuccessOption: none(),
      );
    }, registerWithEmailAndPasswordPressed: (e) async* {
      yield* _performActionOnAuthFacadeWithEmailAndPassword(
        _authFacade.registerWithEmailAndPassword,
      );
    }, signInWithEmailAndPasswordPressed: (e) async* {
      yield* _performActionOnAuthFacadeWithEmailAndPassword(
        _authFacade.signInWithEmailAndPassword,
      );
    }, signInWithGooglePressed: (e) async* {
      yield state.copyWith.call(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );
      final failureOrSuccess = await _authFacade.signInWithGoogle();
      yield state.copyWith.call(
        isSubmitting: false,
        authFailureOrSuccessOption: some(failureOrSuccess),
      );
    });
  }

  Stream<SignInFormState> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function({
      @required EmailAddress emailAddress,
      @required Password password,
    })
        forwardedCall,
  ) async* {
    Either<AuthFailure, Unit> failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );

      failureOrSuccess = await forwardedCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }

    yield state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }
}
