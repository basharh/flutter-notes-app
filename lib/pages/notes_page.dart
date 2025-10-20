import 'package:flutter/material.dart';
import 'package:flutter_notes_app/pages/signed_out_page.dart';
import 'package:flutter_notes_app/providers/auth_service.dart';
import 'package:flutter_notes_app/providers/user.dart';
import 'package:flutter_notes_app/widgets/common/layout/layout.dart';
import 'package:flutter_notes_app/widgets/notes/add_note_form.dart';
import 'package:flutter_notes_app/widgets/notes/filtered_notes_grid.dart';
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
        if (user == null) {
          return SignedOutPage();
        }

        return Layout(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: AddNoteForm(),
                ),
              );
            },
            tooltip: 'Add Note',
            child: const Icon(Icons.add),
          ),
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

                Navigator.pushReplacementNamed(context, '/sign_in');
              },
              tooltip: 'Sign Out',
            ),
          ],
          title: 'Notes',
          child: FilteredNotesGrid(),
        );
      },
    );
  }
}
