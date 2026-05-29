import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'screens/app_routes.dart';
import 'screens/auth/auth_screens.dart';
import 'screens/common/common_state_screens.dart';
import 'screens/home/home_dashboard_screen.dart';
import 'screens/notifications/notifications_screens.dart';
import 'screens/profile/profile_screens.dart';
import 'screens/search/search_screens.dart';
import 'screens/shell/app_shell_screen.dart';

void main() {
  runApp(const ShubheHeShubheApp());
}

class ShubheHeShubheApp extends StatelessWidget {
  const ShubheHeShubheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shubhe He Shubhe',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (_) => const SplashScreen(),
        AppRoutes.welcome: (_) => const WelcomeScreen(),
        AppRoutes.login: (_) => const LoginScreen(),
        AppRoutes.signup: (_) => const SignupScreen(),
        AppRoutes.otp: (_) => const OtpVerificationScreen(),
        AppRoutes.forgotPassword: (_) => const ForgotPasswordScreen(),
        AppRoutes.accountSetup: (_) => const AccountSetupScreen(),
        AppRoutes.shell: (_) => const AppShellScreen(),
        AppRoutes.homeDashboard: (_) => const HomeDashboardScreen(),
        AppRoutes.profileHub: (_) => const ProfileHubScreen(),
        AppRoutes.editProfile: (_) => const EditProfileScreen(),
        AppRoutes.settings: (_) => const SettingsScreen(),
        AppRoutes.notificationSettings: (_) =>
            const NotificationSettingsScreen(),
        AppRoutes.languageSelection: (_) => const LanguageSelectionScreen(),
        AppRoutes.helpSupport: (_) => const HelpSupportScreen(),
        AppRoutes.aboutUs: (_) => const AboutUsScreen(),
        AppRoutes.notificationsList: (_) => const NotificationsListScreen(),
        AppRoutes.notificationDetails: (_) => const NotificationDetailsScreen(),
        AppRoutes.notificationsEmpty: (_) => const NotificationsEmptyScreen(),
        AppRoutes.globalSearch: (_) => const GlobalSearchScreen(),
        AppRoutes.searchResults: (_) => const SearchResultsScreen(),
        AppRoutes.searchEmpty: (_) => const SearchEmptyScreen(),
        AppRoutes.commonStatesDeck: (_) => const CommonStatesDeckScreen(),
        AppRoutes.successState: (_) => const SuccessStateScreen(),
      },
    );
  }
}
