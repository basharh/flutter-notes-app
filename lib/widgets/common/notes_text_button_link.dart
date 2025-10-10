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
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(50, 30),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.centerLeft,
      ),
      onPressed: () {
        Navigator.pushNamed(context, link);
      },
      child: Text(text, style: TextStyle(fontSize: 12)),
    );
  }
}
