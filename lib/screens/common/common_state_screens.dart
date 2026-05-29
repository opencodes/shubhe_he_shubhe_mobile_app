import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/shared/buttons/primary_button.dart';
import '../../core/shared/feedback/loading_state.dart';
import '../app_routes.dart';
import '../shared/screen_components.dart';

enum PreviewState { success, loading, error, offline }

class CommonStatesDeckScreen extends StatefulWidget {
  const CommonStatesDeckScreen({super.key});

  @override
  State<CommonStatesDeckScreen> createState() => _CommonStatesDeckScreenState();
}

class _CommonStatesDeckScreenState extends State<CommonStatesDeckScreen> {
  var _selected = PreviewState.success;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Common States Suite',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'Select a state layout variant to preview:',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: AppSpacing.md),
            ResponsiveGrid(
              minItemWidth: 150,
              children: [
                ActionCard(
                  title: 'Success View',
                  subtitle: 'Task complete',
                  icon: Icons.check_circle_outline,
                  onTap: () => setState(() => _selected = PreviewState.success),
                ),
                ActionCard(
                  title: 'Loading Skeleton',
                  subtitle: 'Processing view',
                  icon: Icons.hourglass_empty,
                  onTap: () => setState(() => _selected = PreviewState.loading),
                ),
                ActionCard(
                  title: 'System Error',
                  subtitle: 'State fallback',
                  icon: Icons.error_outline,
                  onTap: () => setState(() => _selected = PreviewState.error),
                ),
                ActionCard(
                  title: 'No Connection',
                  subtitle: 'Offline sync',
                  icon: Icons.cloud_off,
                  onTap: () => setState(() => _selected = PreviewState.offline),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(minHeight: 240),
              padding: AppSpacing.cardPadding,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: _StatePreview(state: _selected),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatePreview extends StatelessWidget {
  const _StatePreview({required this.state});

  final PreviewState state;

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      PreviewState.success => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.check_circle, color: AppColors.success, size: 56),
          const SizedBox(height: AppSpacing.md),
          Text('Task complete', style: Theme.of(context).textTheme.titleMedium),
          Text(
            'The selected workflow finished successfully.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      PreviewState.loading => const LoadingState(message: 'Processing view...'),
      PreviewState.error => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: AppColors.error, size: 56),
          const SizedBox(height: AppSpacing.md),
          Text('System Error', style: Theme.of(context).textTheme.titleMedium),
          Text(
            'The requested operation could not be completed.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      PreviewState.offline => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.cloud_off, color: AppColors.warning, size: 56),
          const SizedBox(height: AppSpacing.md),
          Text('No Connection', style: Theme.of(context).textTheme.titleMedium),
          Text(
            'Offline sync will resume when the network returns.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    };
  }
}

class SuccessStateScreen extends StatelessWidget {
  const SuccessStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: AppSpacing.screenPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: AppColors.success,
                size: 72,
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                'Operation Complete',
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Your database modifications have been committed successfully to escrow nodes.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.xxl),
              PrimaryButton(
                label: 'Return to Hub',
                onPressed: () => replaceWith(context, AppRoutes.shell),
              ),
              const SizedBox(height: AppSpacing.md),
              TextButton(
                onPressed: () {},
                child: const Text('Download Receipt Token'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
