import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/search_notes_view.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {

@override

void initState(){
  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  super.initState();
}

@override
  void dispose(){
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
            onPressed: (){
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchNotesView();
                  },
                ),
              );
            },
          ),
          const Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
