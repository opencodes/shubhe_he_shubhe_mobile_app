import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/shared/cards/cards_suite.dart';

/// Lists all items matching queried portal terms.
class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Active Results'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.pagePadding),
        children: const [
          ResultSummaryCard(
            title: 'Annual Executive Summit 2026',
            category: 'Main Stage Event',
            matchRatio: '98%',
          ),
          SizedBox(height: AppSpacing.m),
          ResultSummaryCard(
            title: 'Vendor Summit Assembly',
            category: 'Auxiliary Class Room',
            matchRatio: '84%',
          ),
          SizedBox(height: AppSpacing.m),
          ResultSummaryCard(
            title: 'Pre-Summit Briefing',
            category: 'System Document PDF',
            matchRatio: '72%',
          ),
        ],
      ),
    );
  }
}

class ResultSummaryCard extends StatelessWidget {
  final String title;
  final String category;
  final String matchRatio;

  const ResultSummaryCard({
    super.key,
    required this.title,
    required this.category,
    required this.matchRatio,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(category.toUpperCase(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.accent)),
                Text('Match: $matchRatio', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.success)),
              ],
            ),
            const SizedBox(height: 8),
            Text(title, style: AppTextStyles.headingSmall),
          ],
        ),
      ),
    );
  }
}