import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/constants/app_colors.dart';
import '../home/home_dashboard.dart';
import '../notifications/notifications_hub.dart';
import '../profile/profile_hub.dart';

/// Central scaffold routing system wrapping home, profile, and search lists.
class AppShellBase extends StatefulWidget {
  const AppShellBase({super.key});

  @override
  State<AppShellBase> createState() => _AppShellBaseState();
}

class _AppShellBaseState extends State<AppShellBase> {
  int _activeIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _subScreens = [
    const HomeDashboardScreen(),
    const NotificationsHubScreen(),
    const ProfileHubScreen(),
  ];

  void _onTabChanged(int index) {
    HapticFeedback.lightImpact();
    setState(() {
      _activeIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: PageView(
        controller: _pageController,
        onPageChanged: (idx) => setState(() => _activeIndex = idx),
        children: _subScreens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _activeIndex,
        onDestinationSelected: _onTabChanged,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard_outlined), selectedIcon: Icon(Icons.dashboard), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.event_outlined), selectedIcon: Icon(Icons.event), label: 'Events'),
          NavigationDestination(icon: Icon(Icons.store_outlined), selectedIcon: Icon(Icons.store), label: 'Vendors'),
          NavigationDestination(icon: Icon(Icons.notifications_outlined), selectedIcon: Icon(Icons.notifications), label: 'Alerts'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}