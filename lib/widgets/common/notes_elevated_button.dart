import 'package:flutter/material.dart';

class NotesElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const NotesElevatedButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
        padding: WidgetStateProperty.resolveWith(
          (states) => const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
