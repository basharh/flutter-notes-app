import 'package:flutter/material.dart';

enum FilterChoice { all, starred }

class NotesFilter extends StatelessWidget {
  final FilterChoice selectedChoice;
  final ValueChanged<FilterChoice> onSelected;

  const NotesFilter({
    super.key,
    required this.onSelected,
    required this.selectedChoice,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: FilterChoice.values.map((choice) {
        return ChoiceChip(
          label: Text(switch (choice) {
            FilterChoice.all => 'All',
            FilterChoice.starred => 'Starred',
          }),
          selected: selectedChoice == choice,
          onSelected: (selected) {
            if (selected) {
              onSelected(choice);
            }
          },
        );
      }).toList(),
    );
  }
}
