import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesSuccess extends NotesState {}
