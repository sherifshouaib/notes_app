import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/widgets/custom_text_field_edit.dart';
import 'package:notes_app/features/home/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:notes_app/core/storage_helper/models/note_model.dart';
import 'package:notes_app/core/widgets/custom_app_bar.dart';
import 'package:notes_app/features/edit_note/presentation/views/widgets/edit_note_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              CustomAppBar(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // فقط لو الـ title فيه قيمة
                    widget.note.title = title ?? widget.note.title;
                    widget.note.content = content ?? widget.note.content;
                    widget.note.save();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    Navigator.pop(context);
                  }
                },
                title: 'Edit Note',
                icon: Icons.check,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextFieldEdit(
                contentttt: widget.note.title,
                onChanged: (value) {
                  title = value;
                },
                hint: 'title',
                validate: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Field is required';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFieldEdit(
                contentttt: widget.note.content,
                onChanged: (value) {
                  content = value;
                },
                hint: 'content',
                maxLines: 5,
              ),
              const SizedBox(
                height: 16,
              ),
              EditNoteColorsList(
                note: widget.note,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
