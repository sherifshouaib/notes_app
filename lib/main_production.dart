import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/core/utils/constants.dart';
import 'package:notes_app/features/home/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:notes_app/core/storage_helper/models/note_model.dart';
import 'package:notes_app/features/home/presentation/views/notes_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  // sync errors to Crashlytics - main thread errors
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Async errors to Crashlytics - outside main threads - platform specific errors - api requests errors

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  await Hive.initFlutter();

 // Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(kNotesBox);

  
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
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
