import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/stats_row.dart';
import '../widgets/user_info_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: AppTheme.getCardDecoration(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                ProfileAvatar(),
                UserInfoSection(),
                StatsRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
