import 'package:flutter/material.dart';

/// Design tokens from .kiro/steering/ap-digital-design-system.md, mirrored from
/// mockups/_shared.css. Sidebar active indicator = sky blue (Gate 2 A7).
class AppTokens {
  const AppTokens._();

  static const blue700 = Color(0xFF2E3092); // brand / sidebar
  static const blue100 = Color(0xFFD6D7E7);
  static const skyBlue = Color(0xFF00AEEF); // light-blue-700 — active item (A7)
  static const black = Color(0xFF131429); // text primary
  static const grey700 = Color(0xFF5B5B5B); // text secondary
  static const grey100 = Color(0xFFE0E0E0);
  static const page = Color(0xFFF4F5F7);
  static const white = Color(0xFFFFFFFF);
  static const green400 = Color(0xFF08B573);
  static const red400 = Color(0xFFCA2F35);

  // Extra tokens used by the certificate screens (ap-digital-design-system.md §2.3).
  static const green100 = Color(0xFF8EE1C1); // $color-surface-success
  static const red100 = Color(0xFFEAACAE); // $color-surface-error
  static const grey300 = Color(0xFFC3C3C3);
  static const sunshine700 = Color(0xFFFFC000); // modal section bar (ux-02/05)
  static const sunshine100 = Color(0xFFFFF9E5);
  static const sunshine200 = Color(0xFFFFF2CC);

  static const fontFamily = 'Roboto';
}

class AppTheme {
  const AppTheme._();

  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppTokens.blue700,
        primary: AppTokens.blue700,
        surface: AppTokens.white,
      ),
      scaffoldBackgroundColor: AppTokens.page,
      fontFamily: AppTokens.fontFamily,
    );
    return base.copyWith(
      textTheme: base.textTheme.copyWith(
        headlineMedium: const TextStyle(
            fontFamily: AppTokens.fontFamily, fontWeight: FontWeight.w600, color: AppTokens.black),
        titleLarge: const TextStyle(
            fontFamily: AppTokens.fontFamily, fontWeight: FontWeight.w600, color: AppTokens.black),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        isDense: true,
      ),
    );
  }
}
