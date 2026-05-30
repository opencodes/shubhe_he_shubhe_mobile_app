import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

/// Interface representing language bundles setup.
class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languages = [
      'English (United States)',
      'Español (España)',
      'Français (France)',
      'Deutsch (Deutschland)',
      '日本語 (日本)',
      '中文 (简体)',
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Select Language', style: AppTextStyles.headingSmall),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return ListTile(
            title: Text(languages[index], style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
            trailing: isSelected ? const Icon(Icons.check, color: AppColors.accent) : null,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Language modified to ${languages[index]}.'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
  }
}