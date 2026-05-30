import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/shared/buttons/primary_button.dart';
import '../../core/shared/inputs/app_text_field.dart';
import '../../core/shared/feedback/data_elements.dart';
import '../shell/app_shell.dart';

/// Workspace setup capturing user roles and contact nodes.
class AccountSetupScreen extends StatelessWidget {
  const AccountSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text('Account Personalization', style: AppTextStyles.headingSmall),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: AppSpacing.m),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const AppAvatar(
                    fallbackInitials: 'JS',
                    radius: 48,
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.edit, color: Colors.white, size: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('User Details', style: AppTextStyles.headingSmall),
              ),
              const SizedBox(height: AppSpacing.s),
              const AppTextField(
                label: 'User Handle',
                hint: '@janesmith',
              ),
              const SizedBox(height: AppSpacing.m),
              const AppTextField(
                label: 'Designation Role',
                hint: 'Senior Producer',
              ),
              const SizedBox(height: AppSpacing.m),
              const AppTextField(
                label: 'Contact Phone',
                hint: '+1 (555) 0192',
                type: AppFieldType.phone,
              ),
              const SizedBox(height: AppSpacing.xxl),
              PrimaryButton(
                text: 'Enter Dashboard',
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const AppShellBase()),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}