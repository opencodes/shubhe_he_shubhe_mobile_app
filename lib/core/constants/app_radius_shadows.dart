import 'package:flutter/material.dart';
import 'app_colors.dart';

/// [@license Apache-2.0]
/// Radius and organic Shadow constants mimicking premium matte surfaces.
class AppRadius {
  AppRadius._();

  static const double xs = 4.0;
  static const double s = 8.0;
  static const double m = 12.0;
  static const double l = 16.0;
  static const double xl = 24.0;
  static const double xxl = 32.0;

  static const Radius radiusXS = Radius.circular(xs);
  static const Radius radiusS = Radius.circular(s);
  static const Radius radiusM = Radius.circular(m);
  static const Radius radiusL = Radius.circular(l);
  static const Radius radiusXL = Radius.circular(xl);
  static const Radius radiusFixed = Radius.circular(99.0); // Pills & Avatars

  static BorderRadius borderXS = BorderRadius.circular(xs);
  static BorderRadius borderS = BorderRadius.circular(s);
  static BorderRadius borderM = BorderRadius.circular(m);
  static BorderRadius borderL = BorderRadius.circular(l);
  static BorderRadius borderXL = BorderRadius.circular(xl);
  static BorderRadius borderPill = BorderRadius.circular(99.0);
}

class AppShadows {
  AppShadows._();

  /// Soft elevation simulating extremely subtle component layers.
  static final List<BoxShadow> lightElevation = [
    BoxShadow(
      color: AppColors.shadowSubtle,
      blurRadius: 10,
      offset: const Offset(0, 2),
      spreadRadius: 0,
    ),
  ];

  /// Elevated card style modeling light floating segments.
  static final List<BoxShadow> mediumElevation = [
    BoxShadow(
      color: AppColors.shadowMedium,
      blurRadius: 20,
      offset: const Offset(0, 8),
      spreadRadius: -4,
    ),
    BoxShadow(
      color: AppColors.shadowSubtle,
      blurRadius: 4,
      offset: const Offset(0, 1),
      spreadRadius: 0,
    ),
  ];

  /// Premium high floating dropdown layer.
  static final List<BoxShadow> highElevation = [
    BoxShadow(
      color: AppColors.shadowSubtle.withAlpha(25),
      blurRadius: 32,
      offset: const Offset(0, 20),
      spreadRadius: -8,
    ),
  ];
}