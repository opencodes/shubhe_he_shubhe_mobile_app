import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/shared/buttons/primary_button.dart';
import '../../core/shared/inputs/app_text_field.dart';

/// Form suite ensuring safe profile modification.
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

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
        title: Text('Modify Credentials', style: AppTextStyles.headingSmall),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppTextField(label: 'Display Name', hint: 'Jane Smith'),
              const SizedBox(height: AppSpacing.m),
              const AppTextField(label: 'Primary Email', hint: 'jane.smith@monolith.com', type: AppFieldType.email),
              const SizedBox(height: AppSpacing.m),
              const AppTextField(label: 'Contact Mobile', hint: '+1 (555) 0192', type: AppFieldType.phone),
              const SizedBox(height: AppSpacing.m),
              const AppTextField(label: 'Bio / Profile Statement', hint: 'Designing minimalist physical architectures.', type: AppFieldType.textArea),
              const SizedBox(height: AppSpacing.xl),
              PrimaryButton(
                text: 'Save Modifications',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Profile modifications synchronized successfully.'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
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