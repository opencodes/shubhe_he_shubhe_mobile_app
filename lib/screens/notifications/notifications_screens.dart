import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/shared/buttons/primary_button.dart';
import '../../core/shared/buttons/secondary_button.dart';
import '../../core/shared/cards/cards_suite.dart';
import '../../core/shared/feedback/data_elements.dart';
import '../../core/shared/feedback/toast_notifs.dart';
import '../app_routes.dart';
import '../shared/screen_components.dart';

class NotificationsListScreen extends StatefulWidget {
  const NotificationsListScreen({super.key, this.showAppBar = true});

  final bool showAppBar;

  @override
  State<NotificationsListScreen> createState() =>
      _NotificationsListScreenState();
}

class _NotificationsListScreenState extends State<NotificationsListScreen> {
  var _filter = 'All';

  @override
  Widget build(BuildContext context) {
    final filters = ['All', 'Billing', 'System', 'Events'];

    return Scaffold(
      appBar: widget.showAppBar
          ? AppTopBar(
              title: 'System Notifications',
              actions: [
                TextButton(onPressed: () {}, child: const Text('Mark Read')),
              ],
            )
          : null,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: AppSpacing.screenPadding,
              child: Row(
                children: [
                  for (final filter in filters) ...[
                    ChoiceChip(
                      label: Text(filter),
                      selected: _filter == filter,
                      onSelected: (_) => setState(() => _filter = filter),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                  ],
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  0,
                  AppSpacing.lg,
                  AppSpacing.lg,
                ),
                children: [
                  NotificationCard(
                    title: 'Milestone Settled',
                    description:
                        'Invoice #1092 processed for Executive Annual Gala 2026.',
                    category: 'Billing',
                    time: '3m ago',
                    isUnread: true,
                    onTap: () =>
                        navigateTo(context, AppRoutes.notificationDetails),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  NotificationCard(
                    title: 'Vendor Approved',
                    description:
                        'Spine Catering Group satisfied physical security evaluations check.',
                    category: 'Events',
                    time: '2h ago',
                    onTap: () =>
                        navigateTo(context, AppRoutes.notificationDetails),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  NotificationCard(
                    title: 'Service Refresh Complete',
                    description:
                        'System workspace upgraded to v3.4 under active schema rules.',
                    category: 'System',
                    time: '1d ago',
                    onTap: () =>
                        navigateTo(context, AppRoutes.notificationDetails),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    required this.time,
    this.isUnread = false,
    this.onTap,
  });

  final String title;
  final String description;
  final String category;
  final String time;
  final bool isUnread;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '${isUnread ? 'Unread. ' : ''}$title. $time.',
      child: AppCard(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              isUnread ? Icons.notifications_active : Icons.notifications_none,
              color: isUnread ? AppColors.primary : AppColors.textMuted,
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      AppBadge(text: category, color: AppColors.info),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(time, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationDetailsScreen extends StatelessWidget {
  const NotificationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(
        title: 'Invoice Settlement',
        leading: BackIconButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBadge(text: 'Billing Alert', color: AppColors.info),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Milestone Settle Notification',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'Posted 2026-05-29 • 17:24 UTC',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: AppSpacing.xl),
              const AppCard(
                child: Column(
                  children: [
                    KeyValueText(label: 'Target Code', value: 'INV-1092'),
                    SizedBox(height: AppSpacing.md),
                    KeyValueText(
                      label: 'Total Value',
                      value: r'$18,250.00 USD',
                    ),
                    SizedBox(height: AppSpacing.md),
                    KeyValueText(
                      label: 'Sync Origin',
                      value: 'Executive Board Portal',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                'The transaction was approved by security rules on first-check verification. Funds are reserved in Escrow tier clearance.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              PrimaryButton(
                label: 'Download PDF Invoice',
                icon: Icons.download,
                onPressed: () => AppToast.show(
                  context,
                  message: 'PDF invoice downloaded.',
                  type: AppToastType.success,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              SecondaryButton(
                label: 'Flag for Auditing Review',
                icon: Icons.flag_outlined,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationsEmptyScreen extends StatelessWidget {
  const NotificationsEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(title: 'System Notifications'),
      body: Center(
        child: Padding(
          padding: AppSpacing.screenPadding,
          child: EmptyState(
            title: 'All Clear',
            message: 'No pending transaction notifications are active today.',
            icon: Icons.notifications_none,
            action: SizedBox(
              width: 220,
              child: SecondaryButton(
                label: 'Force System Check',
                onPressed: () => AppToast.show(
                  context,
                  message: 'System check complete.',
                  type: AppToastType.info,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
