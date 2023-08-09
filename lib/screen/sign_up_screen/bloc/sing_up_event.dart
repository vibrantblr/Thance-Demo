part of 'sing_up_bloc.dart';

@immutable
sealed class SingUpEvent {}

class SignUpWithEmailPasswordEvent extends SingUpEvent {
  final String email;
  final String password;


  SignUpWithEmailPasswordEvent({
    required this.email,
    required this.password,
  
  });
}
