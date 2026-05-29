import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/shared/buttons/outline_button.dart';
import '../../core/shared/buttons/primary_button.dart';
import '../../core/shared/buttons/secondary_button.dart';
import '../../core/shared/feedback/data_elements.dart';
import '../../core/shared/feedback/toast_notifs.dart';
import '../../core/shared/inputs/app_text_field.dart';
import '../../core/shared/inputs/selection_controls.dart';
import '../app_routes.dart';
import '../shared/screen_components.dart';

class ProfileHubScreen extends StatelessWidget {
  const ProfileHubScreen({super.key, this.showAppBar = true});

  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? AppTopBar(
              title: 'My Profile',
              actions: [
                IconButton(
                  tooltip: 'Settings',
                  onPressed: () => navigateTo(context, AppRoutes.settings),
                  icon: const Icon(Icons.settings_outlined),
                ),
              ],
            )
          : null,
      body: AdaptivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppAvatar(initials: 'JS', size: 80, isElevated: true),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Jane Smith',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'Senior Producer • Event Architect',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: AppSpacing.xl),
            const Row(
              children: [
                Expanded(
                  child: StatCard(title: 'Total Projects', value: '148'),
                ),
                SizedBox(width: AppSpacing.md),
                Expanded(
                  child: StatCard(title: 'System Rating', value: '4.98'),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xxl),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Account Suite',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            ProfileListTile(
              title: 'Account Settings',
              subtitle: 'Manage contact, email, roles',
              icon: Icons.person_outline,
              onTap: () => navigateTo(context, AppRoutes.editProfile),
            ),
            const SizedBox(height: AppSpacing.md),
            ProfileListTile(
              title: 'System Preferences',
              subtitle: 'Haptics, themes, telemetry',
              icon: Icons.tune,
              onTap: () => navigateTo(context, AppRoutes.settings),
            ),
            const SizedBox(height: AppSpacing.md),
            ProfileListTile(
              title: 'Emergency Contact Support',
              subtitle: '24/7 technical operations link',
              icon: Icons.help_outline,
              onTap: () => navigateTo(context, AppRoutes.helpSupport),
            ),
            const SizedBox(height: AppSpacing.xl),
            PrimaryButton(
              label: 'Log Out Session',
              onPressed: () => replaceWith(context, AppRoutes.login),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(
        title: 'Modify Credentials',
        leading: BackIconButton(),
      ),
      body: AdaptivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppTextField(label: 'Display Name', hint: 'Jane Smith'),
            const SizedBox(height: AppSpacing.md),
            const AppTextField(
              label: 'Primary Email',
              hint: 'jane.smith@monolith.com',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: AppSpacing.md),
            const AppTextField(
              label: 'Contact Mobile',
              hint: '+1 (555) 0192',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: AppSpacing.md),
            const AppTextField(
              label: 'Bio / Profile Statement',
              hint: 'Designing minimalist physical architectures.',
              maxLines: 4,
            ),
            const SizedBox(height: AppSpacing.xxl),
            PrimaryButton(
              label: 'Save Modifications',
              onPressed: () {
                AppToast.show(
                  context,
                  message: 'Profile updated.',
                  type: AppToastType.success,
                );
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: AppSpacing.md),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _push = true;
  var _email = false;
  var _biometric = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(
        title: 'System Preferences',
        leading: BackIconButton(),
      ),
      body: ListView(
        padding: AppSpacing.screenPadding,
        children: [
          Text(
            'Communication Channels',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          AppSwitchTile(
            value: _push,
            onChanged: (value) => setState(() => _push = value),
            title: 'Push Notifications',
          ),
          AppSwitchTile(
            value: _email,
            onChanged: (value) => setState(() => _email = value),
            title: 'Email Newsletters',
          ),
          const Divider(),
          Text(
            'Regional Settings',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: AppSpacing.sm),
          ProfileListTile(
            title: 'Active Language',
            subtitle: 'English (US)',
            icon: Icons.language,
            onTap: () => navigateTo(context, AppRoutes.languageSelection),
          ),
          const SizedBox(height: AppSpacing.md),
          ProfileListTile(
            title: 'Notification Controls',
            subtitle: 'Alarms, vendor syncs, billing milestones',
            icon: Icons.notifications_active_outlined,
            onTap: () => navigateTo(context, AppRoutes.notificationSettings),
          ),
          const Divider(),
          Text(
            'Security Configurations',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          AppSwitchTile(
            value: _biometric,
            onChanged: (value) => setState(() => _biometric = value),
            title: 'Biometric FaceID',
            subtitle: _biometric ? 'Enabled' : 'Disabled',
          ),
          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }
}

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  final _values = <String, bool>{
    'New Event Applications': true,
    'Invoice Payments Settled': true,
    'Vendor Portal Chat Messages': false,
    'System Service Updates': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(
        title: 'Notification Controls',
        leading: BackIconButton(),
      ),
      body: AdaptivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dynamic Channel Control',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Receive instant alerts when these events occur.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: AppSpacing.xl),
            for (final entry in _values.entries) ...[
              AppSwitchTile(
                value: entry.value,
                onChanged: (value) =>
                    setState(() => _values[entry.key] = value),
                title: entry.key,
              ),
              const SizedBox(height: AppSpacing.md),
            ],
            const SizedBox(height: AppSpacing.xl),
            PrimaryButton(
              label: 'Settle Configuration',
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  var _selected = 'English (United States)';

  static const _languages = [
    'English (United States)',
    'Español (España)',
    'Français (France)',
    'Deutsch (Deutschland)',
    '日本語 (日本)',
    '中文 (简体)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(
        title: 'Select Language',
        leading: BackIconButton(),
      ),
      body: ListView.separated(
        padding: AppSpacing.screenPadding,
        itemCount: _languages.length,
        separatorBuilder: (_, _) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final language = _languages[index];
          final selected = language == _selected;
          return ListTile(
            title: Text(language),
            trailing: selected ? const Icon(Icons.check) : null,
            selected: selected,
            onTap: () {
              setState(() => _selected = language);
              AppToast.show(
                context,
                message: 'Language set to $language.',
                type: AppToastType.success,
              );
            },
          );
        },
      ),
    );
  }
}

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(
        title: 'Help Desk Center',
        leading: BackIconButton(),
      ),
      body: AdaptivePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchField(hint: 'Search documentation library...'),
            const SizedBox(height: AppSpacing.xl),
            Text(
              'Popular Knowledge Base',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: AppSpacing.sm),
            for (final article in const [
              'Standard Onboarding Rules',
              'Adding Vendors under Material 3',
              'Troubleshooting Realtime WebSockets',
            ]) ...[
              ProfileListTile(
                title: article,
                subtitle: 'Open knowledge base article',
                icon: Icons.article_outlined,
                onTap: () {},
              ),
              const SizedBox(height: AppSpacing.md),
            ],
            const SizedBox(height: AppSpacing.xl),
            const SectionHeader(title: 'Need Human Assistance?'),
            const SizedBox(height: AppSpacing.sm),
            SecondaryButton(
              label: 'Submit Operational Ticket',
              icon: Icons.support_agent,
              onPressed: () {},
            ),
            const SizedBox(height: AppSpacing.md),
            AppOutlineButton(
              label: 'E-mail Technical Operations',
              icon: Icons.mail_outline,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(
        title: 'About Software',
        leading: BackIconButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: AppSpacing.xl),
              const Icon(Icons.blur_on, color: AppColors.primary, size: 64),
              const SizedBox(height: AppSpacing.md),
              Text(
                'MONOLITH ARCHITECTS',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(letterSpacing: 2),
              ),
              Text(
                'System Version 3.4.0 (Build 509)',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: AppSpacing.xxl),
              const KeyValueText(
                label: 'Architects',
                value: 'Google AI Studio & Senior Flutter UX team',
              ),
              const SizedBox(height: AppSpacing.md),
              const KeyValueText(
                label: 'Material Engine',
                value: 'Flutter 3.x System',
              ),
              const SizedBox(height: AppSpacing.md),
              const KeyValueText(
                label: 'Licensing Contract',
                value: 'Apache-2.0 Open Source',
              ),
              const Spacer(),
              Text(
                '© 2026 Monolith Platforms LLC. All copyright guarantees apply.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
