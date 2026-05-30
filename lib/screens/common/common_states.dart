import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/shared/cards/cards_suite.dart';

/// Playground screen for testing state indicators.
class CommonSystemStatesDeckScreen extends StatelessWidget {
  const CommonSystemStatesDeckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Common States Suite'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select a state layout variant:', style: AppTextStyles.bodySmall),
              const SizedBox(height: AppSpacing.m),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: [
                    ActionCard(title: 'Success View', subtitle: 'Task complete', icon: Icons.check_circle_outline, onTap: () {}),
                    ActionCard(title: 'Loading Skeleton', subtitle: 'Processing view', icon: Icons.hourglass_empty, onTap: () {}),
                    ActionCard(title: 'System Error', subtitle: 'State fallback', icon: Icons.error_outline, onTap: () {}),
                    ActionCard(title: 'No Connection', subtitle: 'Offline sync', icon: Icons.cloud_off, onTap: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}