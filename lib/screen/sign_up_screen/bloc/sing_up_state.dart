part of 'sing_up_bloc.dart';

@immutable
sealed class SingUpState {}

class SignUpInitial extends SingUpState {}

class SignUpLoading extends SingUpState {}

class SignUpSuccess extends SingUpState {}

class SignUpFailure extends SingUpState {
  final String error;

  SignUpFailure({required this.error});
}

class UserAlreadyRegisteredState extends SingUpState {}
