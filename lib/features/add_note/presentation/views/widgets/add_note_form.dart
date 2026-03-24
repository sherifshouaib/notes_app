import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/features/add_note/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/features/add_note/presentation/manager/add_note_cubit/add_note_state.dart';
import 'package:notes_app/core/storage_helper/models/note_model.dart';
import 'package:notes_app/features/edit_note/presentation/views/widgets/colors_list_view.dart';
import 'package:notes_app/core/buttons/custom_button.dart';
import 'package:notes_app/core/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
    required this.titleController,
    required this.contentController,
  });
  final TextEditingController titleController;
  final TextEditingController contentController;
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            contentttt: widget.titleController.text,
            controller: widget.titleController,
            onSaved: (value) {
              title = value;
            },
            validate: (value) {
              if (value?.isEmpty ?? true) {
                return 'Field is required';
              } else {
                return null;
              }
            },
            hint: 'title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            contentttt: widget.contentController.text,
            controller: widget.contentController,
            onSaved: (value) {
              content = value;
            },
            hint: 'content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formattedCurrentDate =
                        DateFormat('dd-MM-yyyy').format(currentDate);
                    var noteModel = NoteModel(
                      title: title!,
                      content: content!,
                      date: formattedCurrentDate,
                      color: Colors.blue.toARGB32(),
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    // 👇 امسح القيم هنا
                    widget.titleController.clear();
                    widget.contentController.clear();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
