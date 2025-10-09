import 'package:flutter/material.dart';
import 'package:flutter_notes_app/widgets/common/layout/layout.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Sign In',
      child: const Center(child: Text('Sign In Page Content Here')),
    );
  }
}
