import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFFF6600),
      // Brand Orange
      surfaceTint: Color(0xFFFF6600),
      onPrimary: Color(0xFFFFFFFF),
      // White
      primaryContainer: Color(0xFFFFEFE4),
      // Brand Orange_Lightest
      onPrimaryContainer: Color(0xFF191616),
      // Brand Black
      secondary: Color(0xFF191616),
      // Brand Black
      onSecondary: Color(0xFFFFFFFF),
      // White
      secondaryContainer: Color(0xFFF3F5F9),
      // Grey_Lightest
      onSecondaryContainer: Color(0xFF191616),
      // Brand Black
      tertiary: Color(0xFF0069FF),
      // Brand Blue
      onTertiary: Color(0xFFFFFFFF),
      // White
      tertiaryContainer: Color(0xFFF3F5F9),
      // Grey_Lightest
      onTertiaryContainer: Color(0xFF191616),
      // Brand Black
      error: Color(0xFFFF3600),
      // Brand Red
      onError: Color(0xFFFFFFFF),
      // White
      errorContainer: Color(0xFFFF3600),
      // Brand Red
      onErrorContainer: Color(0xFFFFFFFF),
      // White
      surface: Color(0xFFFFFFFF),
      // White
      onSurface: Color(0xFF191616),
      // Brand Black
      onSurfaceVariant: Color(0xFF7C7B81),
      // Grey_Dark
      outline: Color(0xFF98989F),
      // Grey_Medium
      outlineVariant: Color(0xFFC8C8D1),
      // Grey_Light
      shadow: Color(0xFF000000),
      // Brand Black_Dark
      scrim: Color(0xFF000000),
      // Brand Black_Dark
      inverseSurface: Color(0xFF191616),
      // Brand Black
      inversePrimary: Color(0xFFFFEFE4),
      // Brand Orange_Lightest
      surfaceDim: Color(0xFFF3F5F9),
      // Grey_Lightest
      surfaceBright: Color(0xFFFFFFFF),
      // White
      surfaceContainerLowest: Color(0xFFFFFFFF),
      // White
      surfaceContainerLow: Color(0xFFF3F5F9),
      // Grey_Lightest
      surfaceContainer: Color(0xFFF3F5F9),
      // Grey_Lightest
      surfaceContainerHigh: Color(0xFFC8C8D1),
      // Grey_Light
      surfaceContainerHighest: Color(0xFF98989F), // Grey_Medium
    );
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFFF6600),
      // Brand Orange
      surfaceTint: Color(0xFFFF6600),
      onPrimary: Color(0xFFFFFFFF),
      // White
      primaryContainer: Color(0xFFA04023),
      // Brand Orange_Dark
      onPrimaryContainer: Color(0xFFFFFFFF),
      // White
      secondary: Color(0xFFFFFFFF),
      // White
      onSecondary: Color(0xFF191616),
      // Brand Black
      secondaryContainer: Color(0xFF2B2B2B),
      // Grey_Darkest
      onSecondaryContainer: Color(0xFFFFFFFF),
      // White
      tertiary: Color(0xFF0069FF),
      // Brand Blue
      onTertiary: Color(0xFFFFFFFF),
      // White
      tertiaryContainer: Color(0xFF2B2B2B),
      // Grey_Darkest
      onTertiaryContainer: Color(0xFFFFFFFF),
      // White
      error: Color(0xFFFF3600),
      // Brand Red
      onError: Color(0xFFFFFFFF),
      // White
      errorContainer: Color(0xFFFF3600),
      // Brand Red
      onErrorContainer: Color(0xFFFFFFFF),
      // White
      surface: Color(0xFF191616),
      // Brand Black
      onSurface: Color(0xFFFFFFFF),
      // White
      onSurfaceVariant: Color(0xFFC8C8D1),
      // Grey_Light
      outline: Color(0xFF7C7B81),
      // Grey_Dark
      outlineVariant: Color(0xFF2B2B2B),
      // Grey_Darkest
      shadow: Color(0xFF000000),
      // Brand Black_Dark
      scrim: Color(0xFF000000),
      // Brand Black_Dark
      inverseSurface: Color(0xFFFFFFFF),
      // White
      inversePrimary: Color(0xFFA04023),
      // Brand Orange_Dark
      surfaceDim: Color(0xFF191616),
      // Brand Black
      surfaceBright: Color(0xFF2B2B2B),
      // Grey_Darkest
      surfaceContainerLowest: Color(0xFF000000),
      // Brand Black_Dark
      surfaceContainerLow: Color(0xFF191616),
      // Brand Black
      surfaceContainer: Color(0xFF2B2B2B),
      // Grey_Darkest
      surfaceContainerHigh: Color(0xFF7C7B81),
      // Grey_Dark
      surfaceContainerHighest: Color(0xFF98989F), // Grey_Medium
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: GoogleFonts.spaceGroteskTextTheme().apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
