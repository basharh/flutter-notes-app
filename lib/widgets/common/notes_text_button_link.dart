import 'package:flutter/material.dart';

class NotesTextButtonLink extends StatelessWidget {
  final String link;
  final String text;

  const NotesTextButtonLink({
    super.key,
    required this.link,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, link);
      },
      child: Text(text, style: TextStyle(fontSize: 12)),
    );
  }
}
