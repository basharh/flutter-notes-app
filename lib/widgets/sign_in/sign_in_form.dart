import 'package:flutter/material.dart';
import 'package:flutter_notes_app/providers/auth_service.dart';
import 'package:flutter_notes_app/widgets/common/notes_elevated_button.dart';
import 'package:flutter_notes_app/widgets/common/notes_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({super.key});

  @override
  ConsumerState<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> {
  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotesTextField(
          labelText: 'Email Address',
          controller: _emailAddressController,
        ),
        SizedBox(height: 12),
        NotesTextField(
          labelText: 'Password',
          obscureText: true,
          controller: _passwordController,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [_ForgotPasswordLink()],
        ),
        NotesElevatedButton(
          text: 'Login',
          onPressed: () {
            final authService = ref.read(authServiceProvider);

            final emailAddress = _emailAddressController.text;
            final password = _passwordController.text;

            authService.signInWithEmailAndPassword(
              emailAddress: emailAddress,
              password: password,
            );
          },
        ),
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

/// Forgot Password Link
class _ForgotPasswordLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/forgot_password');
      },
      child: const Text('Forgot Password?', style: TextStyle(fontSize: 12)),
    );
  }
}
