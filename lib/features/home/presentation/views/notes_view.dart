import 'package:flutter/material.dart';
import 'package:notes_app/features/home/presentation/views/widgets/notes_view_body.dart';

import '../../../add_note/presentation/views/add_note_button.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: AddNoteButton(),
      body: SafeArea(
        bottom: true,
        child: NotesViewBody(),
      ),
    );
  }
}
