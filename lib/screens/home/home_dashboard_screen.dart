import 'package:flutter/material.dart';

import '../../core/constants/app_spacing.dart';
import '../../core/shared/cards/cards_suite.dart';
import '../app_routes.dart';
import '../shared/screen_components.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key, this.showAppBar = true});

  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? AppTopBar(
              title: 'Monolith Portal',
              leading: const Padding(
                padding: EdgeInsets.all(8),
                child: AppAvatar(initials: 'JS'),
              ),
              actions: [
                IconButton(
                  tooltip: 'Search',
                  onPressed: () => navigateTo(context, AppRoutes.globalSearch),
                  icon: const Icon(Icons.search),
                ),
              ],
            )
          : null,
      body: AdaptivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good morning, Jane',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: AppSpacing.sm),
            SearchField(
              hint: 'Find events, coordinates, spaces...',
              onTap: () => navigateTo(context, AppRoutes.globalSearch),
            ),
            const SizedBox(height: AppSpacing.xl),
            const SectionHeader(title: 'Portal Quick Actions'),
            const SizedBox(height: AppSpacing.sm),
            ResponsiveGrid(
              minItemWidth: 120,
              children: [
                ActionCard(title: 'Add Event', icon: Icons.add, onTap: () {}),
                ActionCard(
                  title: 'Scan Code',
                  icon: Icons.qr_code,
                  onTap: () {},
                ),
                ActionCard(
                  title: 'Add Vendor',
                  icon: Icons.person_add,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            SectionHeader(
              title: 'Upcoming Events',
              trailing: TextButton(
                onPressed: () {},
                child: const Text('View All'),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            InfoCard(
              title: 'Annual Executive Summit 2026',
              description: 'May 30, 2026 • Orpheum Center',
              icon: Icons.event_available,
              trailing: const AppBadge(text: 'VIP'),
            ),
            const SizedBox(height: AppSpacing.xl),
            const ResponsiveGrid(
              minItemWidth: 160,
              children: [
                StatCard(title: 'Pending Invoices', value: r'$8,290'),
                StatCard(title: 'Confirmed Vendors', value: '42'),
              ],
            ),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }
}
