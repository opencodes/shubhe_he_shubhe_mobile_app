import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'screens/app_routes.dart';
import 'screens/auth/splash_screen.dart';
import 'screens/auth/welcome_screen.dart';

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
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (_) => const SplashScreen(),
        AppRoutes.welcome: (_) => const WelcomeScreen(),
      },
    );
  }
}
