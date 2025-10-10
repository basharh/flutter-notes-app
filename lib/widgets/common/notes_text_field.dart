import 'package:flutter/material.dart';

class NotesTextField extends StatelessWidget {
  final String labelText;
  final bool? obscureText;

  const NotesTextField({
    super.key,
    required this.labelText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        labelStyle: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
      ),
    );
  }
}
