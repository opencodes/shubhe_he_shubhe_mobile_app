import 'package:flutter/material.dart';

enum AppToastType { success, error, info }

class AppToast {
  const AppToast._();

  static void show(
    BuildContext context, {
    required String message,
    AppToastType type = AppToastType.info,
  }) {
    final color = switch (type) {
      AppToastType.success => Colors.green.shade700,
      AppToastType.error => Theme.of(context).colorScheme.error,
      AppToastType.info => Theme.of(context).colorScheme.primary,
    };

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
      ),
    );
  }
}
