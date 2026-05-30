import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/shared/buttons/secondary_button.dart';

/// Clean informative status displayed when there are no alerts.
class NotificationsEmptyStateScreen extends StatelessWidget {
  const NotificationsEmptyStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xxl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.notifications_none, color: AppColors.textTertiary, size: 64),
              const SizedBox(height: AppSpacing.m),
              Text('All Clear', style: AppTextStyles.headingMedium),
              const SizedBox(height: AppSpacing.s),
              Text(
                'No pending transaction notifications are active today.',
                style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xl),
              SizedBox(
                width: 200,
                child: SecondaryButton(
                  text: 'Force System Check',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}