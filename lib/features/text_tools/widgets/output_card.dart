import 'package:flutter/material.dart';

class OutputCard extends StatelessWidget {
  final String text;
  final String label;
  final int maxLines;
  
  const OutputCard({
    super.key,
    required this.text,
    required this.label,
    this.maxLines = 6,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: theme.textTheme.bodySmall?.color,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: maxLines * 24.0,
              ),
              child: text.isEmpty
                  ? Text(
                      'Output will appear here',
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.textTheme.bodySmall?.color,
                      ),
                    )
                  : SelectableText(
                      text,
                      style: const TextStyle(fontSize: 16),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
