// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sing_up_event.dart';
part 'sing_up_state.dart';

class SingUpBloc extends Bloc<SingUpEvent, SingUpState> {
  SingUpBloc() : super(SignUpInitial()) {
    on<SignUpWithEmailPasswordEvent>((event, emit) async {
      emit(SignUpLoading());
      try {
        // Check if the user is already registered
        final isRegistered = await checkIfUserIsRegistered(event.email);

        if (isRegistered) {
          final alredyregister =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          if (alredyregister.user != null) {
            emit(UserAlreadyRegisteredState());
          } else {
            emit(
                SignUpFailure(error: 'Registration failed. Please try again.'));
          }
        } else {
          // Register the user
          final authResult =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );

          // Check if the user registration is successful (non-null user in authResult).
          if (authResult.user != null) {
            emit(SignUpSuccess());
          } else {
            emit(
                SignUpFailure(error: 'Registration failed. Please try again.'));
          }
        }
      } catch (e) {
        emit(SignUpFailure(error: 'Registration failed: $e'));
      }
    });
  }
  Future<bool> checkIfUserIsRegistered(String email) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      return userCredential.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
