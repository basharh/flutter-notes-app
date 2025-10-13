import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget child;
  final List<Widget>? actions;
  final String title;

  const Layout({super.key, required this.child, this.actions, this.title = ''});

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
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ).copyWith(top: 0),
        child: Center(child: child),
      ),
    );
  }
}
