// ignore_for_file: depend_on_referenced_packages

import 'package:ThanceDemo/repo/authentication_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository userRepository;

  HomeBloc({required this.userRepository}) : super(HomeInitial()) {
    on<LoadHomeDataEvent>((event, emit) async {
      emit(HomeLoading());
      try {
        final user = await userRepository.getCurrentUser();
        if (user != null) {
          final name = await userRepository.getUserName(user.uid);
          emit(HomeLoaded(name: name));
        } else {
          emit(HomeError(error: 'User not found.'));
        }
      } catch (e) {
        emit(HomeError(error: 'Failed to load home data: $e'));
      }
    });
  }
}
