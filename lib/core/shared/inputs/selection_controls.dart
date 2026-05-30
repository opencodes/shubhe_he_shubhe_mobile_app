import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

/// [@license Apache-2.0]
/// Curated Checkbox, Switch, and Radio buttons with custom pure white backgrounds.
class AppCheckbox extends StatelessWidget {
  final bool value;
  final String label;
  final ValueChanged<bool?> onChanged;
  final bool isDisabled;

  const AppCheckbox({
    super.key,
    required this.value,
    required this.label,
    required this.onChanged,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled ? null : () => onChanged(!value),
      borderRadius: BorderRadius.circular(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: value,
            onChanged: isDisabled ? null : onChanged,
            activeColor: AppColors.primary,
            side: const BorderSide(color: AppColors.borderMedium, width: 1.5),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              color: isDisabled ? AppColors.textTertiary : AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class AppRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String label;
  final ValueChanged<T?> onChanged;
  final bool isDisabled;

  const AppRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.onChanged,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled ? null : () => onChanged(value),
      borderRadius: BorderRadius.circular(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio<T>(
            value: value,
            groupValue: groupValue,
            onChanged: isDisabled ? null : onChanged,
            activeColor: AppColors.primary,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              color: isDisabled ? AppColors.textTertiary : AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class AppSwitch extends StatelessWidget {
  final bool value;
  final String label;
  final ValueChanged<bool> onChanged;
  final bool isDisabled;

  const AppSwitch({
    super.key,
    required this.value,
    required this.label,
    required this.onChanged,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: isDisabled ? AppColors.textTertiary : AppColors.textPrimary,
          ),
        ),
        Switch.adaptive(
          value: value,
          onChanged: isDisabled ? null : onChanged,
          activeColor: AppColors.primary,
          activeTrackColor: AppColors.primary.withAlpha(50),
          inactiveThumbColor: AppColors.white,
          inactiveTrackColor: AppColors.surfaceSecondary,
        ),
      ],
    );
  }
}