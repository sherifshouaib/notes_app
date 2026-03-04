import 'package:flutter/material.dart';
import 'package:notes_app/features/add_note/presentation/views/widgets/add_note_bottom_sheet.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          context: context,
          builder: (context) {
            return const AddNoteBottomSheet();
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
    );
  }
}
