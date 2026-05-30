import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_radius_shadows.dart';

/// [@license Apache-2.0]
/// Static state visualizers and banner controls.
class AlertBanner extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color backgroundColor;
  final Color contentColor;

  const AlertBanner({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.backgroundColor = AppColors.infoBg,
    this.contentColor = AppColors.info,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: AppRadius.borderM,
        border: Border.all(color: contentColor.withAlpha(50)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: contentColor, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textPrimary),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SuccessBanner extends StatelessWidget {
  final String title;
  final String description;

  const SuccessBanner({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return AlertBanner(
      title: title,
      description: description,
      icon: Icons.check_circle_outline,
      backgroundColor: AppColors.successBg,
      contentColor: AppColors.success,
    );
  }
}

class ErrorBanner extends StatelessWidget {
  final String title;
  final String description;

  const ErrorBanner({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return AlertBanner(
      title: title,
      description: description,
      icon: Icons.error_outline,
      backgroundColor: AppColors.errorBg,
      contentColor: AppColors.error,
    );
  }
}

class AppFeedbackService {
  AppFeedbackService._();

  static void showSimpleToast(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final entry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 50,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.textPrimary,
              borderRadius: AppRadius.borderS,
              boxShadow: AppShadows.mediumElevation,
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

    overlay.insert(entry);
    Future.delayed(const Duration(seconds: 2), () => entry.remove());
  }

  static void showActionSnackbar({
    required BuildContext context,
    required String message,
    required String actionLabel,
    required VoidCallback onAction,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white, fontSize: 14)),
        backgroundColor: AppColors.textPrimary,
        duration: const Duration(seconds: 4),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.borderS),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: actionLabel,
          textColor: AppColors.accent,
          onPressed: onAction,
        ),
      ),
    );
  }
}