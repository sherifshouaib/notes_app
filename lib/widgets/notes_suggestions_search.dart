import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

import '../views/edit_note_view.dart';

class NotesSuggestionsSearch extends StatelessWidget {
  const NotesSuggestionsSearch({
    super.key,
    required this.filteredNotes,
  });

  final List<NoteModel> filteredNotes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filteredNotes.length,
      itemBuilder: (context, index) {
        final note = filteredNotes[index];
        return ListTile(
          title: Text(note.title),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return EditNoteView(
                    note: note,
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
