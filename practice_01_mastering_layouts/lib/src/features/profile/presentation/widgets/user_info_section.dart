import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          'Jane Doe',
          style: textTheme.headlineSmall,
        ),
        const SizedBox(height: AppSpacing.small),
        Text(
          '@janedoe',
          style: textTheme.titleMedium,
        ),
      ],
    );
  }
}
