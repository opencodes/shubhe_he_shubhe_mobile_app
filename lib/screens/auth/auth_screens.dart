import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_radius_shadows.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/shared/buttons/outline_button.dart';
import '../../core/shared/buttons/primary_button.dart';
import '../../core/shared/feedback/toast_notifs.dart';
import '../../core/shared/inputs/app_text_field.dart';
import '../../core/shared/inputs/selection_controls.dart';
import '../app_routes.dart';
import '../shared/screen_components.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var _visible = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 250), () {
      if (mounted) {
        setState(() => _visible = true);
      }
    });
    Timer(const Duration(milliseconds: 2500), () {
      if (mounted) {
        replaceWith(context, AppRoutes.welcome);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Semantics(
        label: 'App starting, Monolith Minimalism Engine Logo',
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: AppRadius.large,
                  boxShadow: AppShadows.soft,
                ),
                child: const Icon(
                  Icons.blur_on,
                  color: AppColors.primary,
                  size: 40,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'MONOLITH',
                style: Theme.of(
                  context,
                ).textTheme.displaySmall?.copyWith(letterSpacing: 4),
              ),
              const SizedBox(height: AppSpacing.sm),
              AnimatedOpacity(
                opacity: _visible ? 1 : 0,
                duration: const Duration(milliseconds: 800),
                child: Text(
                  'Aesthetics Engine',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AdaptivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.xxl),
            Text(
              'A new standard\nfor planning.',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Curated event systems, elite vendor grids, and responsive orchestration designed for Material 3.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            PrimaryButton(
              label: 'Get Started',
              onPressed: () => navigateTo(context, AppRoutes.signup),
            ),
            const SizedBox(height: AppSpacing.md),
            AppOutlineButton(
              label: 'I already have an account',
              onPressed: () => navigateTo(context, AppRoutes.login),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(
        title: 'Access Account',
        leading: BackIconButton(),
      ),
      body: AdaptivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'Please authenticate with your credentials.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: AppSpacing.xl),
            const AppTextField(
              label: 'Account Email',
              hint: 'jane.smith@monolith.com',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: AppSpacing.md),
            const AppTextField(
              label: 'Password',
              hint: 'Password',
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => navigateTo(context, AppRoutes.forgotPassword),
                child: const Text('Forgot password?'),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            PrimaryButton(
              label: 'Sign In',
              onPressed: () => navigateTo(context, AppRoutes.otp),
            ),
            Center(
              child: TextButton(
                onPressed: () => navigateTo(context, AppRoutes.signup),
                child: const Text("Don't have an account? Sign up"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var _accepted = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(
        title: 'Create Account',
        leading: BackIconButton(),
      ),
      body: AdaptivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Begin your journey',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: AppSpacing.xl),
            const AppTextField(label: 'Full Name', hint: 'Jane Smith'),
            const SizedBox(height: AppSpacing.md),
            const AppTextField(
              label: 'Account Email',
              hint: 'jane.smith@monolith.com',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: AppSpacing.md),
            const AppTextField(
              label: 'Password',
              hint: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: AppSpacing.md),
            AppCheckboxTile(
              value: _accepted,
              onChanged: (value) => setState(() => _accepted = value ?? false),
              title: 'I accept User Licensing Framework',
            ),
            const SizedBox(height: AppSpacing.xl),
            PrimaryButton(
              label: 'Create Account',
              onPressed: _accepted
                  ? () => navigateTo(context, AppRoutes.otp)
                  : null,
            ),
            Center(
              child: TextButton(
                onPressed: () => navigateTo(context, AppRoutes.login),
                child: const Text('Already registered? Log in'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(
        title: 'Security Sync',
        leading: BackIconButton(),
      ),
      body: AdaptivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter Security Pin',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'A 4-digit token has been requested for verification.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.xxl),
            Row(
              children: List.generate(
                4,
                (index) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: index == 3 ? 0 : AppSpacing.md,
                    ),
                    child: TextField(
                      autofocus: index == 0,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: const InputDecoration(counterText: ''),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
            PrimaryButton(
              label: 'Verify Token',
              onPressed: () => navigateTo(context, AppRoutes.accountSetup),
            ),
            const SizedBox(height: AppSpacing.md),
            const Center(
              child: TextButton(
                onPressed: null,
                child: Text('Resend Code in 45s'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(title: 'Recover Key', leading: BackIconButton()),
      body: AdaptivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password Recovery',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Provide your institutional email below to request a secured activation link.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.xxl),
            const AppTextField(
              label: 'Registered Email',
              hint: 'jane.smith@monolith.com',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: AppSpacing.xl),
            PrimaryButton(
              label: 'Send Verification Link',
              onPressed: () {
                AppToast.show(
                  context,
                  message: 'Verification link sent.',
                  type: AppToastType.success,
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AccountSetupScreen extends StatelessWidget {
  const AccountSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(title: 'Account Personalization'),
      body: AdaptivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                const AppAvatar(initials: 'JS', size: 96, isElevated: true),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: IconButton.filled(
                    tooltip: 'Upload profile picture',
                    onPressed: () {},
                    icon: const Icon(Icons.edit, size: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'User Details',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            const AppTextField(label: 'User Handle', hint: '@janesmith'),
            const SizedBox(height: AppSpacing.md),
            const AppTextField(
              label: 'Designation Role',
              hint: 'Senior Producer',
            ),
            const SizedBox(height: AppSpacing.md),
            const AppTextField(
              label: 'Contact Phone',
              hint: '+1 (555) 0192',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: AppSpacing.xxl),
            PrimaryButton(
              label: 'Enter Dashboard',
              onPressed: () => replaceWith(context, AppRoutes.shell),
            ),
          ],
        ),
      ),
    );
  }
}
