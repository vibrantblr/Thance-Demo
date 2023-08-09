import 'dart:async';
import 'package:ThanceDemo/core/auth_failure.dart';
import 'package:ThanceDemo/core/domain/email_address.dart';
import 'package:ThanceDemo/core/domain/password.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'validation_event.dart';
part 'validation_state.dart';
part 'validation_bloc.freezed.dart';

class ValidationBloc extends Bloc<ValidationEvent, ValidationState> {
  ValidationBloc() : super(ValidationState.initial()) {
    on<ValidationEvent>((event, emit) async {
      await event.when<FutureOr<void>>(
        emailChanged: (emailString) => _onEmailChanged(emit, emailString),
        passwordChanged: (passwordString) =>
            _onPasswordChanged(emit, passwordString),
        obscurePasswordToggled: () => _onObscurePasswordToggled(emit),
        loginSubmitted: () => _onLoginSubmitted(emit),
      );
    });
  }
  void _onEmailChanged(Emitter<ValidationState> emit, String emailString) {
    emit(
      state.copyWith(
        emailAddress: EmailAddress(emailString),
        authFailureOrSuccess: null,
      ),
    );
  }

  void _onObscurePasswordToggled(Emitter<ValidationState> emit) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  void _onPasswordChanged(
      Emitter<ValidationState> emit, String passwordString) {
    emit(
      state.copyWith(
        password: Password(passwordString),
        authFailureOrSuccess: null,
      ),
    );
  }

  Future<void> _onLoginSubmitted(Emitter<ValidationState> emit) async {
    final isEmailValid = state.emailAddress.value.isRight();
    final isPasswordValid = state.password.value.isRight();

    if (isEmailValid && isPasswordValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          authFailureOrSuccess: null,
        ),
      );

      // Perform network request to get a token.

      await Future.delayed(const Duration(seconds: 1));
    }
    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessage: true,

        // Depending on the response received from the server after loggin in,
        // emit proper authFailureOrSuccess.

        // For now we will just see if the email and password were valid or not
        // and accordingly set authFailureOrSuccess' value.

        authFailureOrSuccess:
            (isEmailValid && isPasswordValid) ? right(unit) : null,
      ),
    );
  }
}
