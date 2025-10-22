import 'package:flutter/material.dart';
import 'package:flutter_notes_app/providers/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Layout extends StatelessWidget {
  final Widget child;
  final List<Widget>? actions;
  final String title;
  final Widget? floatingActionButton;

  const Layout({
    super.key,
    required this.child,
    this.actions,
    this.title = '',
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    final noAppBar = title == '' && actions?.isEmpty != false;

    return Scaffold(
      appBar: noAppBar
          ? null
          : AppBar(
              title: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              actions: [...?actions],
            ),
      floatingActionButton: floatingActionButton,
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ).copyWith(top: 0),
        child: Column(
          children: [
            Expanded(child: child),
            _UserEmail(),
          ],
        ),
      ),
    );
  }
}

class _UserEmail extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Center(
      child: Text(
        user.asData?.value?.email ?? 'Not Signed In',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
      ),
    );
  }
}
