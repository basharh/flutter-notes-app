import 'package:flutter/material.dart';
import 'package:flutter_notes_app/pages/forgot_password_page.dart';
import 'package:flutter_notes_app/pages/notes_page.dart';
import 'package:flutter_notes_app/pages/sign_in_page.dart';
import 'package:flutter_notes_app/pages/sign_up_page.dart';
import 'package:flutter_notes_app/utils/init.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: FlutterNotesApp()));
}

class FlutterNotesApp extends ConsumerWidget {
  final String initialRoute;

  const FlutterNotesApp({super.key, this.initialRoute = '/notes'});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initInfo = ref.watch(initInfoFutureProvider);

    return initInfo.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) {
        //print('Error during initialization: $err');
        return Text('Error: $err, $stack');
      },
      data: (config) {
        return ProviderScope(
          overrides: [initInfoProvider.overrideWithValue(config)],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.indigo.shade900,
              ),
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
              '/notes': (_) => const NotesPage(),
            },
          ),
        );
      },
    );
  }
}
