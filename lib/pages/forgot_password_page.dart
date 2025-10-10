import 'package:flutter/material.dart';
import 'package:flutter_notes_app/widgets/common/layout/layout.dart';
import 'package:flutter_notes_app/widgets/common/notes_elevated_button.dart';
import 'package:flutter_notes_app/widgets/common/notes_text_button_link.dart';
import 'package:flutter_notes_app/widgets/common/notes_text_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Forgot Password',
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              spacing: 12,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Forgot Password',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'Enter valid user name and password to continue',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                Column(
                  children: [
                    NotesTextField(labelText: 'Email'),
                    SizedBox(height: 12),
                    _SendResetLinkButton(),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _SignInLinkWithText(),
          ),
        ],
      ),
    );
  }
}

class _SendResetLinkButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      NotesElevatedButton(onPressed: () {}, text: 'Send Reset Link');
}

/// A widget that shows a sign in link with text
class _SignInLinkWithText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Remember your password? ',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
          ),
          NotesTextButtonLink(text: 'Sign In', link: '/sign_in'),
        ],
      ),
    );
  }
}
