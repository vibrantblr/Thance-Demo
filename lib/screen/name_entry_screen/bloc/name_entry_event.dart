part of 'name_entry_bloc.dart';

@immutable
abstract class NameEntryEvent {}

class SaveNameEvent extends NameEntryEvent {
  final String name;

  SaveNameEvent({required this.name});
}
