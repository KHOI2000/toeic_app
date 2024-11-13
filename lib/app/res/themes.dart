import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData lightTheme = ThemeData(
  extensions: const <ThemeExtension<AppColors>>[
    AppColors(
        primary: Color(0xFF7B5B36),
        secondary: Color(0xFFD2B28D),
        neutral: MaterialColor(
          0xFF04070D,
          {
            50: Color(0xFFF9FAFB),
            100: Color(0xFFF0F0F0),
            200: Color(0xFFE5E7EB),
            300: Color(0xFFD1D5DB),
            400: Color(0xFF9CA3AF),
            500: Color(0xFF929BA8),
            600: Color(0xFF4B5563),
            700: Color(0xFF1E232E),
          },
        ),
        white: Colors.white,
        error: Color(0xFFFF4C4C),
        black: Colors.black,
        background: Color(0xFFf2f5f9),
        success: Color(0xFF00E979),
        blue: Color(0xFF4f6f8d)),
  ],
);

ThemeData darkTheme = ThemeData(
  extensions: const <ThemeExtension<AppColors>>[
    AppColors(
        primary: Color(0xFF7B5B36),
        secondary: Color(0xFFD2B28D),
        neutral: MaterialColor(
          0xFF04070D,
          {
            50: Color(0xFFF9FAFB),
            100: Color(0xFFF0F0F0),
            200: Color(0xFFE5E7EB),
            300: Color(0xFFD1D5DB),
            400: Color(0xFF9CA3AF),
            500: Color(0xFF929BA8),
            600: Color(0xFF4B5563),
            700: Color(0xFF1E232E),
          },
        ),
        white: Colors.white,
        error: Color(0xFFFF4C4C),
        black: Colors.black,
        background: Color(0xFF4B5563),
        success: Color(0xFF00E979),
        blue: Color(0xFF4f6f8d)),
  ],
);
