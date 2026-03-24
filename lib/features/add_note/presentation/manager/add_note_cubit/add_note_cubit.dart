import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/core/utils/constants.dart';
import 'package:notes_app/features/add_note/presentation/manager/add_note_cubit/add_note_state.dart';
import 'package:notes_app/core/storage_helper/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());



Color color= const Color(0xffb8b42d);
  Future<void> addNote(NoteModel note) async {


    note.color=color.toARGB32();
    emit(AddNoteLoading());

    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
     
      emit( AddNoteFailure(e.toString()));
    }
  }
}
