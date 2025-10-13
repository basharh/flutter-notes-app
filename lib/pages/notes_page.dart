import 'package:flutter/material.dart';
import 'package:flutter_notes_app/providers/auth_service.dart';
import 'package:flutter_notes_app/providers/user.dart';
import 'package:flutter_notes_app/widgets/common/layout/layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotesPage extends ConsumerWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return user.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) {
        //print('Error during fetching user: $err');
        return Text('Error: $err, $stack');
      },
      data: (user) {
        return Layout(
          actions: [
            IconButton(
              icon: const Icon(Icons.logout_outlined),
              onPressed: () {
                try {
                  ref.read(authServiceProvider).signOut();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error signing out: $e')),
                  );
                }

                Navigator.pushNamed(context, '/sign_in');
              },
              tooltip: 'Sign Out',
            ),
          ],
          title: 'Notes',
          child: Center(
            child: user == null
                ? const Text('No user')
                : Text('Hello, ${user.displayName}!'),
          ),
        );
      },
    );
  }
}
