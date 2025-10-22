import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/models/note.dart';
import 'package:flutter_notes_app/utils/notes.dart';
import 'package:flutter_notes_app/widgets/notes/notes_filter.dart';
import 'package:flutter_notes_app/widgets/notes/single_note_card.dart';

final notesRef = FirebaseFirestore.instance
    .collection('notes')
    .withConverter<Note>(
      fromFirestore: (snapshots, _) => Note.fromJson(snapshots.data()!),
      toFirestore: (note, _) => note.toJson(),
    );

class FilteredNotesGrid extends StatefulWidget {
  final User user;

  const FilteredNotesGrid({super.key, required this.user});

  @override
  State<FilteredNotesGrid> createState() => _FilteredNotesGridState();
}

class _FilteredNotesGridState extends State<FilteredNotesGrid> {
  var selectedFilter = FilterChoice.all;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: [
        NotesFilter(
          selectedChoice: selectedFilter,
          onSelected: (FilterChoice value) {
            setState(() {
              selectedFilter = value;
            });
          },
        ),
        Expanded(
          child: _NotesGrid(filterChoice: selectedFilter, user: widget.user),
        ),
      ],
    );
  }
}

class _NotesGrid extends StatelessWidget {
  final User user;
  final FilterChoice filterChoice;

  const _NotesGrid({required this.filterChoice, required this.user});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Note>>(
      stream: filterChoice == FilterChoice.starred
          ? notesRef
                .where('starred', isEqualTo: true)
                .where('uid', isEqualTo: user.uid)
                .snapshots()
          : notesRef.where('uid', isEqualTo: user.uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.requireData;

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: data.size,
          itemBuilder: (context, index) {
            final note = data.docs[index].data();
            final noteReference = data.docs[index].reference;

            return SingleNoteCard(
              note: note,
              noteReference: noteReference,
              onTap: () {
                showNoteModalBottomSheet(
                  context: context,
                  user: user,
                  note: note,
                  noteReference: noteReference,
                );
              },
            );
          },
        );
      },
    );
  }
}
