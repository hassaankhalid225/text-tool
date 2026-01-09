import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  final int characters;
  final int words;
  final int lines;
  
  const StatsCard({
    super.key,
    required this.characters,
    required this.words,
    required this.lines,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _StatItem(
              label: 'Characters',
              value: characters.toString(),
              icon: Icons.text_fields,
              theme: theme,
            ),
            _VerticalDivider(theme: theme),
            _StatItem(
              label: 'Words',
              value: words.toString(),
              icon: Icons.article_outlined,
              theme: theme,
            ),
            _VerticalDivider(theme: theme),
            _StatItem(
              label: 'Lines',
              value: lines.toString(),
              icon: Icons.format_list_numbered,
              theme: theme,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final ThemeData theme;
  
  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.theme,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 20,
          color: theme.colorScheme.primary,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: theme.textTheme.bodyLarge?.color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: theme.textTheme.bodySmall?.color,
          ),
        ),
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  final ThemeData theme;
  
  const _VerticalDivider({required this.theme});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 1,
      color: theme.dividerColor.withValues(alpha: 0.2),
    );
  }
}
