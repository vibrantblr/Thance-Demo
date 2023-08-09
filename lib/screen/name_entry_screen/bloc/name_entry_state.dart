part of 'name_entry_bloc.dart';

@immutable
abstract class NameEntryState {}

class NameEntryInitial extends NameEntryState {}

class NameEntrySaving extends NameEntryState {}

class NameEntrySaved extends NameEntryState {}

class NameEntryError extends NameEntryState {
  final String error;

  NameEntryError({required this.error});
}
