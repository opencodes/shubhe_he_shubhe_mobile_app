import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/shared/buttons/primary_button.dart';
import '../../core/shared/buttons/icon_and_loading_buttons.dart';

/// Celebrative visual overlay marking correct operations checkpoint.
class SuccessValidationScreen extends StatelessWidget {
  const SuccessValidationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.pagePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.successBg,
                radius: 40,
                child: Icon(Icons.check, color: AppColors.success, size: 40),
              ),
              const SizedBox(height: AppSpacing.l),
              Text('Operation Complete', style: AppTextStyles.displayMedium),
              const SizedBox(height: AppSpacing.s),
              Text(
                'Your database modifications have been committed successfully to escrow nodes.',
                style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xl),
              PrimaryButton(
                text: 'Return to Hub',
                onPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: AppSpacing.m),
              const AppTextButton(
                text: 'Download Receipt Token',
                onPressed: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}