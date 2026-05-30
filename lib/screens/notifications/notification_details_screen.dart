import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/shared/buttons/primary_button.dart';
import '../../core/shared/buttons/secondary_button.dart';
import '../../core/shared/feedback/data_elements.dart';

/// Screen focusing on specialized transaction details.
class NotificationDetailsScreen extends StatelessWidget {
  const NotificationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Invoice Settlement'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppChip(label: 'Billing Alert'),
              const SizedBox(height: AppSpacing.m),
              Text('Milestone Settle Notification', style: AppTextStyles.headingLarge),
              Text('Posted 2026-05-29 • 17:24 UTC', style: AppTextStyles.caption),
              const SizedBox(height: AppSpacing.l),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: const Column(
                  children: [
                    DetailLineSpec(field: 'Target Code', value: 'INV-1092'),
                    Divider(color: AppColors.border),
                    DetailLineSpec(field: 'Total Value', value: '18,250.00 USD'),
                    Divider(color: AppColors.border),
                    DetailLineSpec(field: 'Sync Origin', value: 'Executive Board'),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.l),
              Text(
                'The transaction was approved by security rules on first-check verification. Funds are reserved in Escrow tier clearance.',
                style: AppTextStyles.bodyMedium.copyWith(height: 1.5),
              ),
              const Spacer(),
              PrimaryButton(
                text: 'Download PDF Invoice',
                prefixIcon: Icons.download_outlined,
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.m),
              SecondaryButton(
                text: 'Flag for Auditing Review',
                icon: Icons.flag,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailLineSpec extends StatelessWidget {
  final String field;
  final String value;

  const DetailLineSpec({super.key, required this.field, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(field, style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
