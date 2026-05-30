import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/shared/buttons/primary_button.dart';
import '../../core/shared/buttons/icon_and_loading_buttons.dart';
import '../../core/shared/inputs/app_text_field.dart';
import '../../core/shared/inputs/selection_controls.dart';
import '../auth/otp_screen.dart';
import '../auth/login_screen.dart';

/// Signup screen prompting user credentials with corporate privacy checklists.
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _acceptTerms = true;

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
        title: Text('Create Account', style: AppTextStyles.headingSmall),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Begin your journey', style: AppTextStyles.headingLarge),
              const SizedBox(height: AppSpacing.l),
              const AppTextField(
                label: 'Full Name',
                hint: 'Jane Smith',
              ),
              const SizedBox(height: AppSpacing.m),
              const AppTextField(
                label: 'Account Email',
                hint: 'jane.smith@monolith.com',
                type: AppFieldType.email,
              ),
              const SizedBox(height: AppSpacing.m),
              const AppTextField(
                label: 'Password',
                hint: '••••••••',
                type: AppFieldType.password,
              ),
              const SizedBox(height: AppSpacing.m),
              AppCheckbox(
                value: _acceptTerms,
                label: 'I accept User Licensing Framework',
                onChanged: (val) {
                  if (val != null) setState(() => _acceptTerms = val);
                },
              ),
              const SizedBox(height: AppSpacing.xl),
              PrimaryButton(
                text: 'Create Account',
                onPressed: _acceptTerms
                    ? () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const OtpVerificationScreen()),
                        );
                      }
                    : null,
              ),
              const SizedBox(height: AppSpacing.m),
              Center(
                child: AppTextButton(
                  text: "Already registered? Log in",
                  textColor: AppColors.textSecondary,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}