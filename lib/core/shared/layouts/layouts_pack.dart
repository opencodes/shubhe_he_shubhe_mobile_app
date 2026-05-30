import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_spacing.dart';

/// [@license Apache-2.0]
/// Complete responsive wrappers and margins to enforce screen purity and safe visual bounds.
class AppScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? drawer;

  const AppScaffold({
    super.key,
    this.title,
    required this.body,
    this.bottomNavigationBar,
    this.leading,
    this.actions,
    this.drawer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: drawer,
      appBar: title != null
          ? AppBar(
              title: Text(
                title!,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: -0.2),
              ),
              centerTitle: true,
              backgroundColor: AppColors.background,
              elevation: 0,
              shape: const Border(bottom: BorderSide(color: AppColors.border, width: 1)),
              leading: leading,
              actions: actions,
            )
          : null,
      body: SafeArea(child: body),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

class AppSection extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? trailing;

  const AppSection({
    super.key,
    required this.title,
    required this.child,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppColors.textSecondary,
                letterSpacing: 0.2,
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}

class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final double maxDesktopWidth;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.maxDesktopWidth = 600.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxDesktopWidth),
        child: child,
      ),
    );
  }
}

class AppPadding extends StatelessWidget {
  final Widget child;

  const AppPadding({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.pagePadding),
      child: child,
    );
  }
}