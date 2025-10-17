import 'package:flutter/material.dart';

class SingleNoteCard extends StatelessWidget {
  final String title;
  final String content;
  final DateTime? createdAt;
  final VoidCallback onTap;

  const SingleNoteCard({
    super.key,
    required this.title,
    required this.content,
    required this.onTap,
    this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Stack(
            children: [
              //Container(color: Colors.red),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.star_outline_outlined, size: 20.0),
                  onPressed: () {},
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8.0),
                  FractionallySizedBox(
                    widthFactor: .92,
                    child: Text(
                      content,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
