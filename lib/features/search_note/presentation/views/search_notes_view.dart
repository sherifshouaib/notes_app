import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/core/widgets/custom_icon.dart';
import 'package:notes_app/features/search_note/presentation/views/widgets/notes_suggestions_search.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/storage_helper/models/note_model.dart';

class SearchNotesView extends StatefulWidget {
  const SearchNotesView({super.key});

  @override
  State<SearchNotesView> createState() => _SearchNotesViewState();
}

class _SearchNotesViewState extends State<SearchNotesView> {
  List<NoteModel> filteredNotes = [];
  var notesBox = Hive.box<NoteModel>(kNotesBox);

// ====== ADDED CODE START ======
  final TextEditingController _controller = TextEditingController();
  // ====== ADDED CODE END ======

// ====== ADDED CODE START ======
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }
// ====== ADDED CODE END ======

  @override
  void dispose() {
    // ====== ADDED CODE START ======
    _controller.dispose();
    // ====== ADDED CODE END ======
    super.dispose();
  }

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
              // ====== ADDED CODE START ======
              controller: _controller,
              // ====== ADDED CODE END ======
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Search notes...',
                border: InputBorder.none,
              ),
              onChanged: searchNotes,
            ),
            actions: [
              // ====== ADDED CODE START ======
              if (_controller.text.isNotEmpty)
                CustomIcon(
                  icon: Icons.close,
                  onPressed: () {
                    _controller.clear();
                    searchNotes("");
                  },
                )
              else
                CustomIcon(
                  icon: Icons.arrow_back,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              // ====== ADDED CODE END ======
            ],
          ),
        ),
      ),
      body: NotesSuggestionsSearch(filteredNotes: filteredNotes),
    );
  }
}
