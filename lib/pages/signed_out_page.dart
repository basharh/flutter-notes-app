import 'package:flutter/material.dart';
import 'package:flutter_notes_app/widgets/common/layout/layout.dart';
import 'package:flutter_notes_app/widgets/common/notes_text_button_link.dart';

class SignedOutPage extends StatelessWidget {
  const SignedOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Center(
        child: Column(
          spacing: 2,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NotesTextButtonLink(link: '/sign_in', text: 'Sign In '),
            SizedBox(width: 8),
            Text(
              'to see your notes',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
