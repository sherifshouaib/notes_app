import 'package:flutter/material.dart';
import 'package:notes_app/core/storage_helper/models/note_model.dart';
import 'package:notes_app/features/edit_note/presentation/views/widgets/edit_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(
        note: note,
      ),
    );
  }
}
