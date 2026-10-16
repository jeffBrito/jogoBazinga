import 'package:flutter/material.dart';

/// Enum que representa os 5 movimentos do jogo clássico de The Big Bang Theory.
enum GameMove {
  pedra,
  papel,
  tesoura,
  lagarto,
  spock,
}

/// Extensão com atributos ricos de design, regras canônicas e textos temáticos.
extension GameMoveExtension on GameMove {
  String get nome {
    switch (this) {
      case GameMove.pedra:
        return 'Pedra';
      case GameMove.papel:
        return 'Papel';
      case GameMove.tesoura:
        return 'Tesoura';
      case GameMove.lagarto:
        return 'Lagarto';
      case GameMove.spock:
        return 'Spock';
    }
  }

  String get assetPath {
    switch (this) {
      case GameMove.pedra:
        return 'assets/images/pedra.png';
      case GameMove.papel:
        return 'assets/images/papel.png';
      case GameMove.tesoura:
        return 'assets/images/tesoura.png';
      case GameMove.lagarto:
        return 'assets/images/largato.jpg';
      case GameMove.spock:
        return 'assets/images/spock.jpg';
    }
  }

  Color get accentColor {
    switch (this) {
      case GameMove.pedra:
        return const Color(0xFFE53935); // Vermelho vibrante
      case GameMove.papel:
        return const Color(0xFF00B0FF); // Azul neon
      case GameMove.tesoura:
        return const Color(0xFFFFB300); // Âmbar / Ouro
      case GameMove.lagarto:
        return const Color(0xFF43A047); // Verde réptil
      case GameMove.spock:
        return const Color(0xFF9C27B0); // Roxo vulcano / cósmico
    }
  }

  /// Verifica se este movimento vence o oponente
  bool vence(GameMove opponent) {
    if (this == opponent) return false;
    switch (this) {
      case GameMove.pedra:
        return opponent == GameMove.tesoura || opponent == GameMove.lagarto;
      case GameMove.papel:
        return opponent == GameMove.pedra || opponent == GameMove.spock;
      case GameMove.tesoura:
        return opponent == GameMove.papel || opponent == GameMove.lagarto;
      case GameMove.lagarto:
        return opponent == GameMove.spock || opponent == GameMove.papel;
      case GameMove.spock:
        return opponent == GameMove.tesoura || opponent == GameMove.pedra;
    }
  }

  /// Retorna o verbo temático da ação de vitória
  static String getActionDescription(GameMove winner, GameMove loser) {
    if (winner == loser) {
      return 'Empate quântico! Ninguém pontuou.';
    }

    if (winner == GameMove.tesoura && loser == GameMove.papel) {
      return 'Tesoura corta Papel!';
    } else if (winner == GameMove.papel && loser == GameMove.pedra) {
      return 'Papel cobre Pedra!';
    } else if (winner == GameMove.pedra && loser == GameMove.lagarto) {
      return 'Pedra esmaga Lagarto!';
    } else if (winner == GameMove.lagarto && loser == GameMove.spock) {
      return 'Lagarto envenena Spock!';
    } else if (winner == GameMove.spock && loser == GameMove.tesoura) {
      return 'Spock esmaga Tesoura!';
    } else if (winner == GameMove.tesoura && loser == GameMove.lagarto) {
      return 'Tesoura decapita Lagarto!';
    } else if (winner == GameMove.lagarto && loser == GameMove.papel) {
      return 'Lagarto devora Papel!';
    } else if (winner == GameMove.papel && loser == GameMove.spock) {
      return 'Papel refuta Spock!';
    } else if (winner == GameMove.spock && loser == GameMove.pedra) {
      return 'Spock vaporiza Pedra!';
    } else if (winner == GameMove.pedra && loser == GameMove.tesoura) {
      return 'Pedra quebra Tesoura!';
    }

    return '${winner.nome} vence ${loser.nome}!';
  }
}

/// Resultado de uma rodada
enum RoundWinner {
  player,
  cpu,
  tie,
}

class RoundEvaluation {
  final RoundWinner winner;
  final GameMove playerMove;
  final GameMove cpuMove;
  final String ruleDescription;
  final String banzingaDialogue;

  RoundEvaluation({
    required this.winner,
    required this.playerMove,
    required this.cpuMove,
    required this.ruleDescription,
    required this.banzingaDialogue,
  });
}
