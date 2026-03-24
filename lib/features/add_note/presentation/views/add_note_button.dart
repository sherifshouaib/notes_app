import 'package:flutter/material.dart';
import 'package:notes_app/features/add_note/presentation/views/widgets/add_note_bottom_sheet.dart';

class AddNoteButton extends StatefulWidget {
  const AddNoteButton({
    super.key,
  });

  @override
  State<AddNoteButton> createState() => _AddNoteButtonState();
}

class _AddNoteButtonState extends State<AddNoteButton> {
// في NotesView
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder: (context) {
              return AddNoteBottomSheet(
                titleController: titleController,
                contentController: contentController,
              );
            },
          );
          // i know there is no exception here ,but we throw exception here
          //to show it on firebase crashlytics dashboard
          //throw Exception();
        },
        backgroundColor: const Color(0xff56EFDB),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
