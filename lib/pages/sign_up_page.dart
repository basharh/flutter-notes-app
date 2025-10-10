import 'package:flutter/material.dart';
import 'package:flutter_notes_app/widgets/common/layout/layout.dart';
import 'package:flutter_notes_app/widgets/common/notes_elevated_button.dart';
import 'package:flutter_notes_app/widgets/common/notes_text_button_link.dart';
import 'package:flutter_notes_app/widgets/common/notes_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Sign Up',
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              spacing: 12,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'Create your account to continue',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Column(
                  children: [
                    NotesTextField(labelText: 'User Name'),
                    SizedBox(height: 12),
                    NotesTextField(labelText: 'Email'),
                    SizedBox(height: 12),
                    NotesTextField(labelText: 'Password', obscureText: true),
                    SizedBox(height: 12),
                    _AgreeToTermsText(),
                    SizedBox(height: 12),
                    _CreateAccountButton(),
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

class _CreateAccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      NotesElevatedButton(onPressed: () {}, text: 'Create Account');
}

/// A widget that shows agree to terms and privacy policy text
class _AgreeToTermsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          'By creating an account, you agree to our ',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
        NotesTextButtonLink(link: '/terms', text: 'Terms of Service'),
        Text(
          ' and ',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
        NotesTextButtonLink(link: '/privacy', text: 'Privacy Policy'),
      ],
    );
  }
}

/// A widget that shows a sign in link with some text
class _SignInLinkWithText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have an account? ',
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
