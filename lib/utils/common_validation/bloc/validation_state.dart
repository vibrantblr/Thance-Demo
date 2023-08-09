part of 'validation_bloc.dart';

@freezed
class ValidationState with _$ValidationState {
  const factory ValidationState({
    required EmailAddress emailAddress,
    required Password password,
    @Default(false) bool isSubmitting,
    @Default(false) bool showErrorMessage,
    @Default(true) bool obscurePassword,
    Either<AuthFailure, Unit>? authFailureOrSuccess,
    // Unit comes from Dartz package and is equivalent to void.
  }) = _LoginFormState;

  factory ValidationState.initial() => ValidationState(
        emailAddress: EmailAddress(''),
        password: Password(''),
      );
}
