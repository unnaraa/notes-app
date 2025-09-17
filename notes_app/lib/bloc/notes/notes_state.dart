part of 'notes_bloc.dart';

@freezed
class NotesState with _$NotesState {
  const factory NotesState.initial() = _Initial;
  const factory NotesState.loading() = _Loading;
  const factory NotesState.loaded(List<Notes> notes) = _Success;
  const factory NotesState.error(String message) = _Error;
}
