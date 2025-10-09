import 'package:flutter/material.dart';
import 'package:flutter_notes_app/widgets/common/layout/layout.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Sign Up',
      child: const Center(child: Text('Sign Up Page Content Here')),
    );
  }
}
