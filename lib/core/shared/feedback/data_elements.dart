import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_radius_shadows.dart';

/// [@license Apache-2.0]
/// Modular visual identifiers, chips to display tags, avatars, and custom dividers.
class AppBadge extends StatelessWidget {
  final int count;
  final Widget? child;

  const AppBadge({
    super.key,
    required this.count,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final badgeWidget = Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
      child: Text(
        count > 99 ? '99+' : count.toString(),
        style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700),
        textAlign: TextAlign.center,
      ),
    );

    if (child != null) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          child!,
          Positioned(
            top: -4,
            right: -4,
            child: badgeWidget,
          )
        ],
      );
    }
    return badgeWidget;
  }
}

class AppChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final ValueChanged<bool>? onSelected;

  const AppChip({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: onSelected,
      selectedColor: AppColors.primary,
      backgroundColor: AppColors.surface,
      disabledColor: AppColors.surfaceSecondary,
      labelStyle: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: isSelected ? Colors.white : AppColors.textPrimary,
      ),
      side: BorderSide(
        color: isSelected ? Colors.transparent : AppColors.border,
        width: 1,
      ),
      shape: RoundedRectangleBorder(borderRadius: AppRadius.borderPill),
      showCheckmark: false,
    );
  }
}

class AppAvatar extends StatelessWidget {
  final String? imageUrl;
  final String fallbackInitials;
  final double radius;

  const AppAvatar({
    super.key,
    this.imageUrl,
    required this.fallbackInitials,
    this.radius = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.surfaceSecondary,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null
          ? Text(
              fallbackInitials.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: radius * 0.7,
                color: AppColors.textPrimary,
                letterSpacing: -0.5,
              ),
            )
          : null,
    );
  }
}

class AppDivider extends StatelessWidget {
  final String? text;

  const AppDivider({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    if (text == null) {
      return const Divider(color: AppColors.border, height: 1);
    }
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.border)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            text!.toUpperCase(),
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
              letterSpacing: 1.0,
            ),
          ),
        ),
        const Expanded(child: Divider(color: AppColors.border)),
      ],
    );
  }
}
