// ignore_for_file: depend_on_referenced_packages

import 'package:ThanceDemo/repo/authentication_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'name_entry_event.dart';
part 'name_entry_state.dart';

class NameEntryBloc extends Bloc<NameEntryEvent, NameEntryState> {
  final UserRepository userRepository; // your UserRepository class

  NameEntryBloc({required this.userRepository}) : super(NameEntryInitial()) {
    on<SaveNameEvent>((event, emit) async {
      emit(NameEntrySaving());
      try {
        final user = await userRepository.getCurrentUser();
        if (user != null) {
          await userRepository.saveName(user.uid, event.name);
          emit(NameEntrySaved());
        } else {
          emit(NameEntryError(error: 'User not found.'));
        }
      } catch (e) {
        emit(NameEntryError(error: 'Failed to save name: $e'));
      }
    });
  }
}
