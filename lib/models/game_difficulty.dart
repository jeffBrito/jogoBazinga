import 'package:flutter/material.dart';

/// Níveis de dificuldade da inteligência da CPU
enum GameDifficulty {
  facil,
  normal,
  dificil,
}

extension GameDifficultyExtension on GameDifficulty {
  String get title {
    switch (this) {
      case GameDifficulty.facil:
        return 'Fácil';
      case GameDifficulty.normal:
        return 'Normal';
      case GameDifficulty.dificil:
        return 'Difícil';
    }
  }

  String get subtitle {
    switch (this) {
      case GameDifficulty.facil:
        return 'Sheldon Distraído';
      case GameDifficulty.normal:
        return 'Leonard Equilibrado';
      case GameDifficulty.dificil:
        return 'Sheldon QI 187 (Bazinga!)';
    }
  }

  String get description {
    switch (this) {
      case GameDifficulty.facil:
        return 'A CPU comete erros estratégicos frequentes e prevê pouco seus movimentos.';
      case GameDifficulty.normal:
        return 'A CPU joga de forma estocástica e balanceada, sem trapaças nem desvantagens.';
      case GameDifficulty.dificil:
        return 'A CPU analisa seus padrões comportamentais anteriores e tenta anular sua jogada!';
    }
  }

  Color get color {
    switch (this) {
      case GameDifficulty.facil:
        return const Color(0xFF4CAF50); // Verde suave
      case GameDifficulty.normal:
        return const Color(0xFFFF9800); // Laranja alerta
      case GameDifficulty.dificil:
        return const Color(0xFFE53935); // Vermelho Bazinga
    }
  }

  IconData get icon {
    switch (this) {
      case GameDifficulty.facil:
        return Icons.sentiment_satisfied_alt;
      case GameDifficulty.normal:
        return Icons.psychology_outlined;
      case GameDifficulty.dificil:
        return Icons.local_fire_department_rounded;
    }
  }
}
