import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_radius_shadows.dart';

/// [@license Apache-2.0]
/// Complete suite of smaller typography triggers and micro buttons.
class AppTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color textColor;

  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor = AppColors.accent,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: textColor,
        minimumSize: Size.zero,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.borderS),
      ),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
    );
  }
}

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool isSecondary;

  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.isSecondary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSecondary ? AppColors.surfaceSecondary : Colors.transparent,
        border: Border.all(color: AppColors.border, width: isSecondary ? 0 : 1),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, size: 20),
        color: AppColors.textPrimary,
        onPressed: onPressed,
        constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
      ),
    );
  }
}

class LoadingButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback onPressed;

  const LoadingButton({
    super.key,
    required this.text,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isLoading ? AppColors.surfaceSecondary : AppColors.primary,
        borderRadius: AppRadius.borderM,
        border: Border.all(color: isLoading ? AppColors.border : Colors.transparent),
      ),
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        borderRadius: AppRadius.borderM,
        child: Center(
          child: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.textSecondary),
                  ),
                )
              : Text(
                  text,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}