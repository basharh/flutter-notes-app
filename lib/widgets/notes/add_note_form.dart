import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/models/note.dart';

/// A form for adding or editing a note given an optional [note] and its [noteReference].
class AddNoteForm extends StatefulWidget {
  final Note? note;
  final DocumentReference<Note>? noteReference;

  const AddNoteForm({super.key, this.note, this.noteReference});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  Future<void> _saveNote() async {
    final title = _titleController.text;
    final content = _contentController.text;

    final doc = await FirebaseFirestore.instance.collection('notes').add({
      'title': title,
      'content': content,
      'createdAt': DateTime.now().toIso8601String(),
      'updatedAt': DateTime.now().toIso8601String(),
    });
  }

  Future<void> _updateNote() async {
    if (widget.noteReference == null || widget.note == null) {
      return;
    }

    final title = _titleController.text;
    final content = _contentController.text;

    await widget.noteReference!.update({
      'title': title,
      'content': content,
      'updatedAt': DateTime.now().toIso8601String(),
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.note != null && widget.noteReference != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            maxLines: 1,
            controller: _titleController,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Content'),
            maxLines: null,
            controller: _contentController,
          ),
          ElevatedButton(
            onPressed: () async {
              if (widget.note != null && widget.noteReference != null) {
                await _updateNote();
              } else {
                await _saveNote();
              }

              if (mounted) {
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              }
            },
            child: const Text('Save Note'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
