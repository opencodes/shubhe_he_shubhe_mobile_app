import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/shared/cards/cards_suite.dart';
import '../../core/shared/feedback/data_elements.dart';
import '../../core/shared/layouts/layouts_pack.dart';
import '../search/global_search_screen.dart';

/// Primary summary cockpit of the running enterprise portal.
class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: AppAvatar(fallbackInitials: 'JS', radius: 18),
        ),
        title: Text('Monolith Portal', style: AppTextStyles.headingSmall),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.textPrimary),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const GlobalSearchScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good morning, Jane', style: AppTextStyles.displayMedium),
            const SizedBox(height: AppSpacing.s),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const GlobalSearchScreen()),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: AppColors.textSecondary, size: 20),
                    const SizedBox(width: 8),
                    Text('Find events, coordinates, spaces...', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.l),
            const AppSection(
              title: 'Portal Quick Actions',
              child: Row(
                children: [
                  Expanded(child: QuickActionItem(title: 'Add Event', icon: Icons.add_circle_outline)),
                  SizedBox(width: AppSpacing.s),
                  Expanded(child: QuickActionItem(title: 'Scan Code', icon: Icons.qr_code_scanner)),
                  SizedBox(width: AppSpacing.s),
                  Expanded(child: QuickActionItem(title: 'Add Vendor', icon: Icons.person_add_alt_1_outlined)),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.l),
            AppSection(
              title: 'Upcoming Events',
              child: BaseCard(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Annual Executive Summit 2026', style: AppTextStyles.headingSmall),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(6)),
                            child: const Text('VIP', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.s),
                      Row(
                        children: [
                          const Icon(Icons.calendar_month, size: 14, color: AppColors.textSecondary),
                          const SizedBox(width: 6),
                          Text('May 30, 2026', style: AppTextStyles.bodySmall),
                          const SizedBox(width: 14),
                          const Icon(Icons.location_on, size: 14, color: AppColors.textSecondary),
                          const SizedBox(width: 6),
                          Text('Orpheum Center', style: AppTextStyles.bodySmall),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.l),
            const Row(
              children: [
                Expanded(child: StatCard(label: 'Pending Invoices', value: '8,290')),
                SizedBox(width: AppSpacing.s),
                Expanded(child: StatCard(label: 'Confirmed Vendors', value: '42')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuickActionItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const QuickActionItem({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primary, size: 24),
          const SizedBox(height: 8),
          Text(title, style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.bold, fontSize: 11)),
        ],
      ),
    );
  }
}