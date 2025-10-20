import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/models/note.dart';
import 'package:flutter_notes_app/widgets/notes/add_note_form.dart';

void showNoteModalBottomSheet({
  required BuildContext context,
  Note? note,
  DocumentReference<Note>? noteReference,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: AddNoteForm(note: note, noteReference: noteReference),
    ),
  );
}
