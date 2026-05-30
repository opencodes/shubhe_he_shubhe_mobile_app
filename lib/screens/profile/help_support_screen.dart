import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/shared/buttons/secondary_button.dart';
import '../../core/shared/buttons/outline_button.dart';
import '../../core/shared/inputs/app_text_field.dart';

/// Corporate self-service and direct operational ticket generator.
class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Help Desk Center', style: AppTextStyles.headingSmall),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppTextField(
                label: '',
                hint: 'Search documentation library...',
                type: AppFieldType.search,
              ),
              const SizedBox(height: AppSpacing.l),
              Text('Popular Knowledge Base', style: AppTextStyles.labelMedium),
              const SizedBox(height: AppSpacing.s),
              const HelpArticleItem(title: 'Standard Onboarding Rules'),
              const HelpArticleItem(title: 'Adding Vendors under Material 3'),
              const HelpArticleItem(title: 'Troubleshooting Realtime WebSockets'),
              const SizedBox(height: AppSpacing.xl),
              Text('Need Human Assistance?', style: AppTextStyles.headingSmall),
              const SizedBox(height: AppSpacing.s),
              SecondaryButton(
                text: 'Submit Operational Ticket',
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.m),
              OutlineButton(
                text: 'E-mail Technical Operations',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HelpArticleItem extends StatelessWidget {
  final String title;

  const HelpArticleItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.article_outlined, color: AppColors.textSecondary),
      title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      trailing: const Icon(Icons.chevron_right, size: 18, color: AppColors.borderMedium),
    );
  }
}