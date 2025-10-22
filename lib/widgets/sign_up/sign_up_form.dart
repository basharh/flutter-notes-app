import 'package:flutter/material.dart';
import 'package:flutter_notes_app/providers/auth_service.dart';
import 'package:flutter_notes_app/widgets/common/notes_elevated_button.dart';
import 'package:flutter_notes_app/widgets/common/notes_text_button_link.dart';
import 'package:flutter_notes_app/widgets/common/notes_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpForm extends ConsumerWidget {
  // TODO: check if better to have these in the state
  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();

  SignUpForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        NotesTextField(labelText: 'Email', controller: _emailAddressController),
        SizedBox(height: 12),
        NotesTextField(
          labelText: 'Password',
          obscureText: true,
          controller: _passwordController,
        ),
        SizedBox(height: 12),
        _AgreeToTermsText(),
        SizedBox(height: 12),
        NotesElevatedButton(
          onPressed: () async {
            final authService = ref.read(authServiceProvider);

            try {
              await authService.createUserWithEmailAndPassword(
                emailAddress: _emailAddressController.text,
                password: _passwordController.text,
              );
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Error: $e')));
              }
              return;
            }

            if (context.mounted) {
              Navigator.pushReplacementNamed(context, '/notes');
            }
          },
          text: 'Create Account',
        ),
      ],
    );
  }
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
