import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/shared/buttons/primary_button.dart';

/// Informative screen shown when search results are empty.
class SearchEmptyStateScreen extends StatelessWidget {
  const SearchEmptyStateScreen({super.key});

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
              const Icon(Icons.search_off, size: 64, color: AppColors.textTertiary),
              const SizedBox(height: AppSpacing.m),
              Text('No Results Matching', style: AppTextStyles.headingMedium),
              const SizedBox(height: AppSpacing.s),
              Text(
                'We searched coordinates and event databases but found nothing for your prompt.',
                style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xl),
              SizedBox(
                width: 220,
                child: PrimaryButton(
                  text: 'Modify Query Term',
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}