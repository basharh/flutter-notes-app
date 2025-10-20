import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

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
              await _saveNote();

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
}
