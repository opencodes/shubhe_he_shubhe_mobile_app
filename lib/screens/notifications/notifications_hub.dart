import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/shared/feedback/toast_notifs.dart';
import '../../core/theme/app_text_styles.dart';

/// Dashboard compiling unread operations alerts, invoice paid markers, etc.
class NotificationsHubScreen extends StatefulWidget {
  const NotificationsHubScreen({super.key});

  @override
  State<NotificationsHubScreen> createState() => _NotificationsHubScreenState();
}

class _NotificationsHubScreenState extends State<NotificationsHubScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text('System Notifications', style: AppTextStyles.headingSmall),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.pagePadding),
          children: const [
            AlertBanner(
              title: 'Milestone Settled',
              description: 'Invoice #1092 processed for Executive Annual Gala 2026.',
              icon: Icons.check_circle_outline,
              backgroundColor: AppColors.successBg,
              contentColor: AppColors.success,
            ),
            SizedBox(height: AppSpacing.m),
            AlertBanner(
              title: 'Vendor Approved',
              description: 'Spine Catering Group satisfied physical security evaluations check.',
              icon: Icons.star_outline,
              backgroundColor: AppColors.infoBg,
              contentColor: AppColors.info,
            ),
            SizedBox(height: AppSpacing.m),
            AlertBanner(
              title: 'Service Refresh Complete',
              description: 'System workspace upgraded to v3.4 under active schema rules.',
              icon: Icons.update,
              backgroundColor: AppColors.warningBg,
              contentColor: AppColors.warning,
            ),
          ],
        ),
      ),
    );
  }
}