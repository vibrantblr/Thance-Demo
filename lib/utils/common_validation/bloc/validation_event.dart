part of 'validation_bloc.dart';

@freezed
class ValidationEvent with _$ValidationEvent {
  const factory ValidationEvent.emailChanged(String emailString) =
      _EmailChanged;

  const factory ValidationEvent.passwordChanged(String passwordString) =
      _PasswordChanged;

  const factory ValidationEvent.obscurePasswordToggled() =
      _ObscurePasswordToggled;

  const factory ValidationEvent.loginSubmitted() = _LoginSubmitted;
}
