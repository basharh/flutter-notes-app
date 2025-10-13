import 'package:flutter/material.dart';
import 'package:flutter_notes_app/widgets/common/layout/layout.dart';
import 'package:flutter_notes_app/widgets/common/notes_text_button_link.dart';

class SignedOutPage extends StatelessWidget {
  const SignedOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          NotesTextButtonLink(link: '/sign_in', text: 'Sign In '),
          Text(
            'to see your notes',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
