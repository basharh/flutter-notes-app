import 'package:flutter/material.dart';
import 'package:flutter_notes_app/pages/forgot_password_page.dart';
import 'package:flutter_notes_app/pages/sign_in_page.dart';
import 'package:flutter_notes_app/pages/sign_up_page.dart';

void main() {
  runApp(const FlutterNotesApp());
}

class FlutterNotesApp extends StatelessWidget {
  final String initialRoute;

  const FlutterNotesApp({super.key, this.initialRoute = '/sign_in'});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo.shade900),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ),
      ),
      initialRoute: initialRoute,
      routes: {
        '/sign_in': (_) => const SignInPage(),
        '/sign_up': (_) => const SignUpPage(),
        '/forgot_password': (_) => const ForgotPasswordPage(),
      },
    );
  }
}
