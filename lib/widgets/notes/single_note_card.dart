import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/models/note.dart';

class SingleNoteCard extends StatelessWidget {
  final Note note;
  final DocumentReference<Note> noteReference;
  final VoidCallback onTap;

  const SingleNoteCard({
    super.key,
    required this.onTap,
    required this.note,
    required this.noteReference,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Stack(
            children: [
              //Container(color: Colors.red),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.star_outline_outlined, size: 20.0),
                  onPressed: () {
                    // TODO: create a firestore transaction and toggle the starred field
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8.0),
                  FractionallySizedBox(
                    widthFactor: .92,
                    child: Text(
                      note.content,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
