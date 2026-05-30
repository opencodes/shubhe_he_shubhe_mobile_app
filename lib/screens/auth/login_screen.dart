import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/shared/buttons/icon_and_loading_buttons.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/shared/buttons/primary_button.dart';
import '../../core/shared/inputs/app_text_field.dart';
import '../auth/otp_screen.dart';
import '../auth/signup_screen.dart';
import '../auth/forgot_password_screen.dart';

/// Login form setup integrating validation and secure key recover workflows.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
        title: Text('Access Account', style: AppTextStyles.headingSmall),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back', style: AppTextStyles.headingLarge),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Please authenticate with your credentials.',
                style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: AppSpacing.xl),
              AppTextField(
                label: 'Account Email',
                hint: 'jane.smith@monolith.com',
                type: AppFieldType.email,
                controller: _emailController,
              ),
              const SizedBox(height: AppSpacing.m),
              AppTextField(
                label: 'Password',
                hint: '••••••••',
                type: AppFieldType.password,
                controller: _passwordController,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: AppTextButton(
                  text: 'Forgot password?',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSpacing.l),
              PrimaryButton(
                text: 'Sign In',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const OtpVerificationScreen()),
                  );
                },
              ),
              const SizedBox(height: AppSpacing.m),
              Center(
                child: AppTextButton(
                  text: "Don't have an account? Sign up",
                  textColor: AppColors.textSecondary,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SignupScreen()),
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