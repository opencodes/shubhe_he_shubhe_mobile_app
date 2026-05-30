import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/shared/inputs/selection_controls.dart';
import '../profile/language_selection_screen.dart';

/// Central dashboard for managing notifications and security parameters.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _pushSelected = true;
  bool _biometricSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('System Preferences', style: AppTextStyles.headingSmall),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          const SettingsHead(title: 'Communication Channels'),
          AppSwitch(
            value: _pushSelected,
            label: 'Push Notifications',
            onChanged: (val) => setState(() => _pushSelected = val),
          ),
          const Divider(color: AppColors.border),
          const SettingsHead(title: 'Regional Settings'),
          ListTile(
            title: const Text('Active Language', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
            subtitle: const Text('English (US)', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
            trailing: const Icon(Icons.chevron_right, color: AppColors.borderMedium),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LanguageSelectionScreen()),
              );
            },
          ),
          const Divider(color: AppColors.border),
          const SettingsHead(title: 'Security Configurations'),
          AppSwitch(
            value: _biometricSelected,
            label: 'Biometric FaceID',
            onChanged: (val) => setState(() => _biometricSelected = val),
          ),
        ],
      ),
    );
  }
}

class SettingsHead extends StatelessWidget {
  final String title;

  const SettingsHead({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textSecondary, letterSpacing: 1.0),
      ),
    );
  }
}