import 'package:flutter/material.dart';

class NotesElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const NotesElevatedButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
