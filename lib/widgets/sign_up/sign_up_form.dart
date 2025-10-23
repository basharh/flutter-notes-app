import 'package:flutter/material.dart';
import 'package:flutter_notes_app/providers/auth_service.dart';
import 'package:flutter_notes_app/utils/auth.dart';
import 'package:flutter_notes_app/widgets/common/notes_elevated_button.dart';
import 'package:flutter_notes_app/widgets/common/notes_text_button_link.dart';
import 'package:flutter_notes_app/widgets/common/notes_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({super.key});

  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _createAccount() async {
    final authService = ref.read(authServiceProvider);

    try {
      await authService.createUserWithEmailAndPassword(
        emailAddress: _emailAddressController.text,
        password: _passwordController.text,
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          // ignore: use_build_context_synchronously
          context,
        ).showSnackBar(
          SnackBar(content: Text(getErrorMessageForAuthException(e))),
        );
        //).showSnackBar(SnackBar(content: Text('Error: $e')));
      }

      return;
    }

    if (context.mounted) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/notes');
    }
  }

  @override
  Widget build(BuildContext context) {
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
        NotesElevatedButton(onPressed: _createAccount, text: 'Create Account'),
      ],
    );
  }

  @override
  void dispose() {
    _emailAddressController.dispose();
    _passwordController.dispose();
    super.dispose();
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
