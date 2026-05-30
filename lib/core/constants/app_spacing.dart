import 'package:flutter/material.dart';

/// [@license Apache-2.0]
/// Strictly defined sizing variables utilizing a premium Apple 8px logic.
class AppSpacing {
  AppSpacing._();

  static const double xxs = 4.0;
  static const double xs = 8.0;
  static const double s = 12.0;
  static const double m = 16.0;
  static const double l = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double xxxl = 64.0;

  // Outer constraints
  static const double pagePadding = 16.0;
  static const double bentoSpacing = 12.0;

  // Reusable Gap widgets for elegant, non-wasteful UI writing.
  static const Widget gapXXS = SizedBox(width: xxs, height: xxs);
  static const Widget gapXS = SizedBox(width: xs, height: xs);
  static const Widget gapS = SizedBox(width: s, height: s);
  static const Widget gapM = SizedBox(width: m, height: m);
  static const Widget gapL = SizedBox(width: l, height: l);
  static const Widget gapXL = SizedBox(width: xl, height: xl);
  static const Widget gapXXL = SizedBox(width: xxl, height: xxl);
}