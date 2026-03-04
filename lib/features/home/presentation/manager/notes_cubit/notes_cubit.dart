import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/features/home/presentation/manager/notes_cubit/notes_state.dart';
import 'package:notes_app/core/storage_helper/models/note_model.dart';

import '../../../../../core/utils/constants.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;
  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();

    emit(NotesSuccess());
  }
}
