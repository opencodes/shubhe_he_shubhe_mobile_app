import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/shared/buttons/primary_button.dart';
import '../../core/shared/feedback/data_elements.dart';
import '../profile/edit_profile_screen.dart';
import '../profile/settings_screen.dart';

/// Central workspace profile metadata dashboard.
class ProfileHubScreen extends StatelessWidget {
  const ProfileHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text('My Profile', style: AppTextStyles.headingSmall),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppAvatar(fallbackInitials: 'JS', radius: 40),
              const SizedBox(height: AppSpacing.m),
              Text('Jane Smith', style: AppTextStyles.headingLarge),
              Text('Senior Producer • Event Architect', style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary)),
              const SizedBox(height: AppSpacing.l),
              const IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProfileDetailCol(label: 'Total Projects', value: '148'),
                    VerticalDivider(color: AppColors.border),
                    ProfileDetailCol(label: 'System Rating', value: '4.98'),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Account Suite', style: AppTextStyles.labelMedium),
              ),
              const SizedBox(height: AppSpacing.s),
              ProfileMenuTile(
                title: 'Account Settings',
                subtitle: 'Manage contact, email, roles',
                icon: Icons.person_outline,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const EditProfileScreen()),
                  );
                },
              ),
              ProfileMenuTile(
                title: 'System Preferences',
                subtitle: 'Haptics, themes, telemetry',
                icon: Icons.tune,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SettingsScreen()),
                  );
                },
              ),
              const SizedBox(height: AppSpacing.xl),
              PrimaryButton(
                text: 'Log Out Session',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileDetailCol extends StatelessWidget {
  final String label;
  final String value;

  const ProfileDetailCol({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: AppTextStyles.headingMedium.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: AppTextStyles.caption),
      ],
    );
  }
}

class ProfileMenuTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileMenuTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textPrimary),
      title: Text(title, style: AppTextStyles.headingSmall.copyWith(fontSize: 15)),
      subtitle: Text(subtitle, style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary, fontSize: 12)),
      trailing: const Icon(Icons.chevron_right, color: AppColors.textSecondary, size: 20),
      onTap: onTap,
    );
  }
}