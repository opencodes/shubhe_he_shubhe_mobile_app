import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/shared/buttons/primary_button.dart';
import '../../core/shared/cards/cards_suite.dart';
import '../../core/shared/feedback/data_elements.dart';
import '../app_routes.dart';
import '../shared/screen_components.dart';

class GlobalSearchScreen extends StatefulWidget {
  const GlobalSearchScreen({super.key});

  @override
  State<GlobalSearchScreen> createState() => _GlobalSearchScreenState();
}

class _GlobalSearchScreenState extends State<GlobalSearchScreen> {
  final _selected = <String>{'Designers'};

  @override
  Widget build(BuildContext context) {
    final scopes = ['Designers', 'Auditoriums', 'Contractors'];

    return Scaffold(
      appBar: const AppTopBar(title: 'Portal Query Hub'),
      body: AdaptivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchField(
              hint: 'Query code, vendor names, dates...',
              autoFocus: true,
              onTap: () => navigateTo(context, AppRoutes.searchResults),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              'Active Search Scopes',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              children: [
                for (final scope in scopes)
                  FilterChip(
                    label: Text(scope),
                    selected: _selected.contains(scope),
                    onSelected: (selected) {
                      setState(() {
                        selected
                            ? _selected.add(scope)
                            : _selected.remove(scope);
                      });
                    },
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              'Recent Queries',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: AppSpacing.sm),
            for (final term in const [
              'Annual Executive Summit 2026',
              'Catering Licences Type-4',
              'Escrow clearing guidelines',
            ])
              ListTile(
                leading: const Icon(Icons.history),
                title: Text(term),
                onTap: () => navigateTo(context, AppRoutes.searchResults),
              ),
          ],
        ),
      ),
    );
  }
}

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(
        title: 'Active Results',
        leading: BackIconButton(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: AppSpacing.screenPadding,
              color: AppColors.surfaceSoft,
              child: Text(
                '3 items found for Summit 2026',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            Expanded(
              child: ListView(
                padding: AppSpacing.screenPadding,
                children: [
                  SearchResultCard(
                    title: 'Annual Executive Summit 2026',
                    type: 'Main Stage Event',
                    relevance: '98%',
                    date: 'May 30, 2026',
                    onTap: () =>
                        navigateTo(context, AppRoutes.notificationDetails),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  SearchResultCard(
                    title: 'Vendor Summit Assembly',
                    type: 'Auxiliary Class Room',
                    relevance: '84%',
                    date: 'June 14, 2026',
                    onTap: () =>
                        navigateTo(context, AppRoutes.notificationDetails),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  SearchResultCard(
                    title: 'Pre-Summit Briefing',
                    type: 'System Document PDF',
                    relevance: '72%',
                    date: 'May 28, 2026',
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

class SearchResultCard extends StatelessWidget {
  const SearchResultCard({
    super.key,
    required this.title,
    required this.type,
    required this.relevance,
    required this.date,
    this.onTap,
  });

  final String title;
  final String type;
  final String relevance;
  final String date;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      title: title,
      description: '$type • $date',
      icon: Icons.manage_search,
      trailing: AppBadge(text: relevance),
    );
  }
}

class SearchEmptyScreen extends StatelessWidget {
  const SearchEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(
        title: 'Active Results',
        leading: BackIconButton(),
      ),
      body: Center(
        child: Padding(
          padding: AppSpacing.screenPadding,
          child: EmptyState(
            title: 'No Results Matching',
            message:
                'We searched coordinates and event databases but found nothing for your prompt.',
            icon: Icons.search_off,
            action: SizedBox(
              width: 220,
              child: PrimaryButton(
                label: 'Modify Query Term',
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
