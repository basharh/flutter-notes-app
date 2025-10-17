import 'package:flutter/material.dart';
import 'package:flutter_notes_app/widgets/notes/notes_filter.dart';
import 'package:flutter_notes_app/widgets/notes/single_note_card.dart';

class FilteredNotesGrid extends StatefulWidget {
  const FilteredNotesGrid({super.key});

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
        Expanded(child: _NotesGrid()),
      ],
    );
  }
}

class _NotesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 20, // Example item count
      itemBuilder: (context, index) {
        return SingleNoteCard(
          title: 'Note ${index + 1}',
          content: 'This is the content of note ${index + 1}.',
          onTap: () {},
        );
      },
    );
  }
}
