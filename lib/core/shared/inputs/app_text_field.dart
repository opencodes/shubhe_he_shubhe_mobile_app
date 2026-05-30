import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

enum AppFieldType { text, search, password, phone, email, textArea }

/// [@license Apache-2.0]
/// A high-performance, single component handling all keyboard inputs.
class AppTextField extends StatefulWidget {
  final String label;
  final String hint;
  final AppFieldType type;
  final TextEditingController? controller;
  final String? errorText;
  final bool isDisabled;
  final ValueChanged<String>? onChanged;

  const AppTextField({
    super.key,
    required this.label,
    required this.hint,
    this.type = AppFieldType.text,
    this.controller,
    this.errorText,
    this.isDisabled = false,
    this.onChanged,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    TextInputType keyboardType;
    int maxLines = 1;
    Widget? prefix;
    Widget? suffix;

    switch (widget.type) {
      case AppFieldType.search:
        keyboardType = TextInputType.text;
        prefix = const Icon(Icons.search, color: AppColors.textSecondary, size: 20);
        break;
      case AppFieldType.password:
        keyboardType = TextInputType.visiblePassword;
        suffix = IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
            color: AppColors.textSecondary,
            size: 20,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        );
        break;
      case AppFieldType.phone:
        keyboardType = TextInputType.phone;
        prefix = Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 4),
          child: Text(
            '+1',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              fontSize: 15,
            ),
          ),
        );
        break;
      case AppFieldType.email:
        keyboardType = TextInputType.emailAddress;
        prefix = const Icon(Icons.alternate_email, color: AppColors.textSecondary, size: 18);
        break;
      case AppFieldType.textArea:
        keyboardType = TextInputType.multiline;
        maxLines = 5;
        break;
      default:
        keyboardType = TextInputType.text;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label.isNotEmpty) ...[
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
        ],
        TextFormField(
          controller: widget.controller,
          keyboardType: keyboardType,
          obscureText: widget.type == AppFieldType.password && _obscureText,
          maxLines: maxLines,
          enabled: !widget.isDisabled,
          onChanged: widget.onChanged,
          style: TextStyle(
            fontSize: 15,
            color: widget.isDisabled ? AppColors.textSecondary : AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: widget.hint,
            errorText: widget.errorText,
            prefixIcon: prefix != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 14),
                      prefix,
                    ],
                  )
                : null,
            prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
            suffixIcon: suffix,
          ),
        ),
      ],
    );
  }
}