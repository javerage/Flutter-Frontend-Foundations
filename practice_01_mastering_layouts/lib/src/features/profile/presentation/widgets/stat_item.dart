import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class StatItem extends StatelessWidget {
  const StatItem({
    super.key,
    required this.label,
    required this.value,
    this.icon = Icons.bar_chart, // Default icon
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: colorScheme.primary,
          size: 30,
        ),
        const SizedBox(height: AppSpacing.statItemSpacing),
        Text(
          value,
          style: textTheme.bodyLarge,
        ),
        const SizedBox(height: AppSpacing.statItemSpacing),
        Text(
          label,
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }
}
