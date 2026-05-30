import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';

/// Overview representing software version details and licensing credits.
class AboutMonolithScreen extends StatelessWidget {
  const AboutMonolithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('About Software'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: AppSpacing.xl),
              const Icon(Icons.blur_on, size: 64, color: AppColors.primary),
              const SizedBox(height: AppSpacing.m),
              Text('MONOLITH ARCHITECTS', style: AppTextStyles.headingSmall.copyWith(letterSpacing: 2)),
              Text('System Version 3.4.0 (Build 509)', style: AppTextStyles.caption),
              const SizedBox(height: AppSpacing.xl),
              const Divider(color: AppColors.border),
              const LicenseKeyRow(label: 'Architects', value: 'Google AI Studio & UX team'),
              const LicenseKeyRow(label: 'Material Engine', value: 'Flutter 3.x System'),
              const LicenseKeyRow(label: 'Licensing Contract', value: 'Apache-2.0 Open Source'),
              const Spacer(),
              Text('© 2026 Monolith Platforms LLC.', style: AppTextStyles.caption),
            ],
          ),
        ),
      ),
    );
  }
}

class LicenseKeyRow extends StatelessWidget {
  final String label;
  final String value;

  const LicenseKeyRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: AppColors.textSecondary)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    );
  }
}