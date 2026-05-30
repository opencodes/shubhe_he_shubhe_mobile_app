import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/shared/inputs/app_text_field.dart';

/// Standard quick filter search entry point.
class GlobalSearchScreen extends StatelessWidget {
  const GlobalSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Portal Query Hub'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppTextField(
                label: '',
                hint: 'Query code, vendor names, dates...',
                type: AppFieldType.search,
              ),
              const SizedBox(height: AppSpacing.l),
              Text('Active Search Scopes', style: AppTextStyles.labelMedium),
              const SizedBox(height: AppSpacing.s),
              const Wrap(
                spacing: 8,
                children: [
                  ChoiceChip(label: Text('Designers'), selected: true),
                  ChoiceChip(label: Text('Auditoriums'), selected: false),
                  ChoiceChip(label: Text('Contractors'), selected: false),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),
              Text('Recent Queries', style: AppTextStyles.labelMedium),
              const SizedBox(height: AppSpacing.s),
              const SuggestionListRow(term: 'Annual Executive Summit 2026'),
              const SuggestionListRow(term: 'Catering Licences Type-4'),
              const SuggestionListRow(term: 'Escrow clearing guidelines'),
            ],
          ),
        ),
      ),
    );
  }
}

class SuggestionListRow extends StatelessWidget {
  final String term;

  const SuggestionListRow({super.key, required this.term});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.history, color: AppColors.textSecondary, size: 18),
      title: Text(term, style: const TextStyle(fontSize: 14)),
      trailing: const Icon(Icons.arrow_outward, size: 16, color: AppColors.borderMedium),
    );
  }
}