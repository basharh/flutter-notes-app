import 'package:flutter/material.dart';
import 'package:flutter_notes_app/widgets/common/layout/layout.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Forgot Password',
      child: const Center(child: Text('Forgot Password Page Content Here')),
    );
  }
}

