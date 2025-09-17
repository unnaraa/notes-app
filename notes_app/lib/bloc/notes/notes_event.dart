part of 'notes_bloc.dart';

@freezed
class NotesEvent with _$NotesEvent {
  const factory NotesEvent.started() = _Started;
  const factory NotesEvent.syncNotes() = _SyncNotes; //buat sinkronisasi
  const factory NotesEvent.getLocalNotes() = _GetNotesLocal; //buat ambil data local
  //buat CRUD
  const factory NotesEvent.createNotes(Notes model) = _CreateNotes;
  const factory NotesEvent.updateNotes(Notes model) = _UpdateNotes;
  const factory NotesEvent.deleteNotes(Notes model) = _DeleteNotes;
}