import 'package:flutter/material.dart';

/// Tema visual premium inspirado no universo geek e cósmico de The Big Bang Theory
class AppTheme {
  // Paleta de Cores Primárias
  static const Color primaryDark = Color(0xFF140E36);
  static const Color primaryBlue = Color(0xFF272362);
  static const Color accentBazingaRed = Color(0xFFE52521);
  static const Color accentGold = Color(0xFFFFD166);
  static const Color accentCyan = Color(0xFF00E5FF);
  static const Color accentGreen = Color(0xFF06D6A0);
  static const Color cardBg = Color(0xFF1E184F);
  static const Color cardSurface = Color(0x33FFFFFF);

  // Gradientes
  static const LinearGradient bgGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF2E1C6A),
      Color(0xFF1B1545),
      Color(0xFF0F0B29),
    ],
  );

  static const LinearGradient bazingaButtonGradient = LinearGradient(
    colors: [
      Color(0xFFFF3B30),
      Color(0xFFD61A16),
    ],
  );

  static const LinearGradient rulesButtonGradient = LinearGradient(
    colors: [
      Color(0xFF8A3FFC),
      Color(0xFF6929C4),
    ],
  );

  static const LinearGradient victoryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF1B4332),
      Color(0xFF081C15),
    ],
  );

  static const LinearGradient defeatGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF49111C),
      Color(0xFF1E070B),
    ],
  );

  // Sombras estilizadas
  static List<BoxShadow> glowShadow(Color color, {double blur = 14, double spread = 1}) {
    return [
      BoxShadow(
        color: color.withOpacity(0.4),
        blurRadius: blur,
        spreadRadius: spread,
        offset: const Offset(0, 4),
      ),
    ];
  }

  // Estilo do Tema Material
  static ThemeData get themeData {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: primaryDark,
      primaryColor: primaryBlue,
      colorScheme: const ColorScheme.dark(
        primary: accentBazingaRed,
        secondary: accentGold,
        surface: cardBg,
      ),
      fontFamily: 'Roboto',
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
