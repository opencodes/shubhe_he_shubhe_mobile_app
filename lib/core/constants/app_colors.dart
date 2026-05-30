import 'package:flutter/material.dart';

/// [@license Apache-2.0]
/// Premium Minimalist Color Token Library.
/// Designed with #FFFFFF Pure White base, soft tone-on-tone grays,
/// and intense obsidian-black semantic accents.
class AppColors {
  AppColors._();

  // Primary Branding & Accent Colors
  static const Color primary = Color(0xFF000000); // Pure Obsidian
  static const Color accent = Color(0xFF007AFF);  // Apple Blue Accent
  
  // Backgrounds & Surfaces
  static const Color background = Color(0xFFFFFFFF); // Pure White Base
  static const Color surface = Color(0xFFFBFBFD);    // Off-White Apple Surface
  static const Color surfaceSecondary = Color(0xFFF5F5F7); // Subtle Light Gray Surface
  static const Color border = Color(0xFFE5E5EA);     // Fine Hairline Gray Border
  static const Color borderMedium = Color(0xFFD1D1D6); // Interactive Mid-contrast Border

  // Neutral Solid Grays
  static const Color textPrimary = Color(0xFF1D1D1F);   // Dark Slate Gray
  static const Color textSecondary = Color(0xFF86868B); // Cool System Muted Gray
  static const Color textTertiary = Color(0xFFB0B0B5);  // Delicate Placeholder Gray
  static const Color white = Color(0xFFFFFFFF);

  // Semantic Status Colors
  static const Color success = Color(0xFF34C759); // Apple Green
  static const Color successBg = Color(0xFFEAF9EE);
  static const Color warning = Color(0xFFFF9500); // Apple Orange
  static const Color warningBg = Color(0xFFFFF4E5);
  static const Color error = Color(0xFFFF3B30);   // Apple Red
  static const Color errorBg = Color(0xFFFFEBEA);
  static const Color info = Color(0xFF5856D6);    // Apple Violet/Indigo
  static const Color infoBg = Color(0xFFF1F0FC);

  // Alpha Overlays for Dynamic Shadows
  static const Color shadowOpaque = Color(0xFF000000);
  static Color shadowSubtle = const Color(0xFF000000).withAlpha(10); // ~4% opacity
  static Color shadowMedium = const Color(0xFF000000).withAlpha(18); // ~7% opacity
}