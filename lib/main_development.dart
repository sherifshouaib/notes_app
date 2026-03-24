import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/core/utils/constants.dart';
import 'package:notes_app/features/home/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:notes_app/core/storage_helper/models/note_model.dart';
import 'package:notes_app/features/home/presentation/views/notes_view.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: const NotesView(),
      ),
    );
  }
}
