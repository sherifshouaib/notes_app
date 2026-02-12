import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/widgets/custom_icon.dart';
import 'package:notes_app/widgets/notes_suggestions_search.dart';

import '../constants.dart';
import '../models/note_model.dart';

class SearchNotesView extends StatefulWidget {
  const SearchNotesView({super.key});

  @override
  State<SearchNotesView> createState() => _SearchNotesViewState();
}

class _SearchNotesViewState extends State<SearchNotesView> {
  List<NoteModel> filteredNotes = [];
  var notesBox = Hive.box<NoteModel>(kNotesBox);

  void searchNotes(String query) {
    final allNotes = notesBox.values.toList();

    if (query.isEmpty) {
      filteredNotes = allNotes;
    } else {
      filteredNotes = allNotes.where((note) {
        final title = note.title.toLowerCase();
        //  final subTitle = note.subTitle.toLowerCase();
        final search = query.toLowerCase();

        return title.contains(search);
        // || subTitle.contains(search);
      }).toList();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 25,
            right: 10,
            left: 10,
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: TextField(
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Search notes...',
                border: InputBorder.none,
              ),
              onChanged: searchNotes,
            ),
            actions: [
              CustomIcon(
                icon: Icons.close,
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: NotesSuggestionsSearch(filteredNotes: filteredNotes),
    );
  }
}
