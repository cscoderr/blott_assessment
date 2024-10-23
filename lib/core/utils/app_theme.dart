import 'package:blott_assessment/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static TextTheme get _textTheme => GoogleFonts.robotoTextTheme().copyWith(
        titleLarge: GoogleFonts.roboto(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryTextColor,
        ),
        titleMedium: GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
        ),
        titleSmall: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.secondaryTextColor,
        ),
        bodyLarge: GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryTextColor,
        ),
        bodySmall: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.white.withOpacity(0.7),
        ),
      );

  static ThemeData _main() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        surface: AppColors.backgroundColor,
      ),
      useMaterial3: true,
      textTheme: _textTheme,
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: _textTheme.bodyLarge?.copyWith(
          color: AppColors.placeholderTextColor,
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.borderColor,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.borderColor,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.borderColor,
          ),
        ),
      ),
    );
  }

  static ThemeData light() {
    return _main();
  }

  static ThemeData dark() {
    return _main().copyWith(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        brightness: Brightness.dark,
      ),
    );
  }
}
