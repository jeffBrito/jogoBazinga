import 'dart:math';
import '../models/game_move.dart';
import '../models/game_difficulty.dart';

/// Serviço inteligente que gerencia a inteligência artificial da CPU
/// para o jogo Pedra, Papel, Tesoura, Lagarto e Spock.
class CpuAiService {
  final Random _random = Random();

  /// Histórico de jogadas realizadas pelo jogador na partida atual
  final List<GameMove> _playerHistory = [];

  /// Histórico de jogadas realizadas pela CPU
  final List<GameMove> _cpuHistory = [];

  /// Histórico de resultados (true se jogador venceu, false se perdeu, null empate)
  final List<RoundWinner> _roundResults = [];

  /// Limpa o estado mental da CPU para uma nova partida
  void resetGame() {
    _playerHistory.clear;
    _cpuHistory.clear;
    _roundResults.clear;
  }

  /// Registra o resultado da rodada para aprendizado da CPU
  void recordRound({
    required GameMove playerMove,
    required GameMove cpuMove,
    required RoundWinner winner,
  }) {
    _playerHistory.add(playerMove);
    _cpuHistory.add(cpuMove);
    _roundResults.add(winner);
  }

  /// Seleciona o movimento da CPU de acordo com a dificuldade configurada
  GameMove decideMove(GameDifficulty difficulty) {
    switch (difficulty) {
      case GameDifficulty.facil:
        return _decideEasyMove();
      case GameDifficulty.normal:
        return _decideNormalMove();
      case GameDifficulty.dificil:
        return _decideHardMove();
    }
  }

  /// MODO FÁCIL (Sheldon Distraído):
  /// Dá 55% de chance de cometer uma decisão ruim (jogar o que perde para o jogador),
  /// permitindo que o jogador vença com facilidade e se divirta.
  GameMove _decideEasyMove() {
    if (_playerHistory.isNotEmpty && _random.nextDouble() < 0.55) {
      final lastPlayerMove = _playerHistory.last;
      // Escolhe um movimento que PERDE para a última jogada do jogador
      final losingMoves = GameMove.values
          .where((move) => lastPlayerMove.vence(move))
          .toList();
      if (losingMoves.isNotEmpty) {
        return losingMoves[_random.nextInt(losingMoves.length)];
      }
    }
    // Caso contrário, joga aleatório
    return _getRandomMove();
  }

  /// MODO NORMAL (Leonard Equilibrado):
  /// Aleatório uniforme justo com suavização para evitar 3 repetições consecutivas.
  GameMove _decideNormalMove() {
    GameMove move = _getRandomMove();
    if (_cpuHistory.length >= 2 &&
        _cpuHistory[_cpuHistory.length - 1] == move &&
        _cpuHistory[_cpuHistory.length - 2] == move) {
      // Evita repetição excessiva
      final alternatives =
          GameMove.values.where((m) => m != move).toList();
      return alternatives[_random.nextInt(alternatives.length)];
    }
    return move;
  }

  /// MODO DIFÍCIL (Sheldon QI 187 - Bazinga Master!):
  /// Utiliza análise preditiva comportamental:
  /// 1. Matriz de transição de Markov (o que o jogador joga após cada movimento)
  /// 2. Heurística psicológica "Win-Stay / Lose-Shift" de teoria dos jogos
  /// 3. Contra-ataque de alta precisão (80% tático, 20% estocástico)
  GameMove _decideHardMove() {
    // Se ainda não temos dados suficientes, joga com boa distribuição inicial
    if (_playerHistory.isEmpty) {
      // Estatisticamente, novatos humanos costumam abrir muito com Pedra ou Tesoura.
      // Papel ou Spock contra-atacam isso.
      final smartOpeners = [GameMove.spock, GameMove.papel];
      return smartOpeners[_random.nextInt(smartOpeners.length)];
    }

    // 20% de chance de ruído caótico para não ficar 100% mecânico/explorável
    if (_random.nextDouble() < 0.20) {
      return _getRandomMove();
    }

    final predictedPlayerMove = _predictNextPlayerMove();

    // Encontra os movimentos que VENCEM a previsão do jogador
    final winningCounters = GameMove.values
        .where((move) => move.vence(predictedPlayerMove))
        .toList();

    if (winningCounters.isNotEmpty) {
      return winningCounters[_random.nextInt(winningCounters.length)];
    }

    return _getRandomMove();
  }

  /// Faz a predição da próxima jogada do jogador baseada em psicologia e histórico
  GameMove _predictNextPlayerMove() {
    final lastPlayerMove = _playerHistory.last;
    final lastResult = _roundResults.isNotEmpty ? _roundResults.last : null;

    // 1. Transição de Markov se houver histórico de 3 ou mais rodadas
    if (_playerHistory.length >= 3) {
      final Map<GameMove, int> transitions = {};
      for (int i = 0; i < _playerHistory.length - 1; i++) {
        if (_playerHistory[i] == lastPlayerMove) {
          final next = _playerHistory[i + 1];
          transitions[next] = (transitions[next] ?? 0) + 1;
        }
      }

      if (transitions.isNotEmpty) {
        GameMove? mostFrequent;
        int maxCount = 0;
        transitions.forEach((move, count) {
          if (count > maxCount) {
            maxCount = count;
            mostFrequent = move;
          }
        });
        if (mostFrequent != null) {
          return mostFrequent!;
        }
      }
    }

    // 2. Heurística Win-Stay, Lose-Shift (Psicologia de Jogos)
    if (lastResult == RoundWinner.player) {
      // Jogador venceu na rodada anterior: 65% de tendência a repetir a jogada vitoriosa
      if (_random.nextDouble() < 0.65) {
        return lastPlayerMove;
      }
    } else if (lastResult == RoundWinner.cpu && _cpuHistory.isNotEmpty) {
      // Jogador perdeu: humanos raramente repetem a mesma jogada perdedora;
      // eles costumam tentar jogar o que venceria o movimento da CPU na rodada anterior!
      final lastCpuMove = _cpuHistory.last;
      final whatBeatsCpu = GameMove.values
          .where((m) => m.vence(lastCpuMove))
          .toList();
      if (whatBeatsCpu.isNotEmpty) {
        return whatBeatsCpu[_random.nextInt(whatBeatsCpu.length)];
      }
    }

    // 3. Fallback: jogada mais frequente do jogador
    return _getMostFrequentPlayerMove() ?? _getRandomMove();
  }

  GameMove? _getMostFrequentPlayerMove() {
    if (_playerHistory.isEmpty) return null;
    final Map<GameMove, int> counts = {};
    for (var m in _playerHistory) {
      counts[m] = (counts[m] ?? 0) + 1;
    }
    GameMove? best;
    int max = 0;
    counts.forEach((move, count) {
      if (count > max) {
        max = count;
        best = move;
      }
    });
    return best;
  }

  GameMove _getRandomMove() {
    return GameMove.values[_random.nextInt(GameMove.values.length)];
  }

  /// Avalia a rodada e gera a frase de Sheldon Cooper
  RoundEvaluation evaluateRound(GameMove playerMove, GameMove cpuMove) {
    RoundWinner winner;
    if (playerMove == cpuMove) {
      winner = RoundWinner.tie;
    } else if (playerMove.vence(cpuMove)) {
      winner = RoundWinner.player;
    } else {
      winner = RoundWinner.cpu;
    }

    final ruleDesc = GameMoveExtension.getActionDescription(
      winner == RoundWinner.player
          ? playerMove
          : (winner == RoundWinner.cpu ? cpuMove : playerMove),
      winner == RoundWinner.player
          ? cpuMove
          : (winner == RoundWinner.cpu ? playerMove : cpuMove),
    );

    final dialogue = _getSheldonDialogue(winner);

    return RoundEvaluation(
      winner: winner,
      playerMove: playerMove,
      cpuMove: cpuMove,
      ruleDescription: ruleDesc,
      banzingaDialogue: dialogue,
    );
  }

  String _getSheldonDialogue(RoundWinner winner) {
    switch (winner) {
      case RoundWinner.cpu:
        final phrases = [
          'Bazinga! Seu padrão de jogo é dolorosamente previsível!',
          'Bazinga! Eu tenho um QI de 187, o que você esperava?',
          'Bazinga! Você caiu em mais uma das minhas brincadeiras clássicas!',
          'A física teórica e a teoria dos jogos triunfam novamente!',
          'Bazinga! Ponto para a mente mais brilhante da Califórnia!',
        ];
        return phrases[_random.nextInt(phrases.length)];

      case RoundWinner.player:
        final phrases = [
          'Inaceitável! Claramente uma anomalia estatística quântica!',
          'Você teve sorte... a probabilidade estava contra você.',
          'Leonard andou sabotando meus algoritmos preditivos?',
          'Fascinante! Uma escolha totalmente desprovida de lógica que funcionou!',
          'Desfrute do ponto temporário, a física teórica logo se corrigirá!',
        ];
        return phrases[_random.nextInt(phrases.length)];

      case RoundWinner.tie:
        final phrases = [
          'Um impasse de Schrödinger! Ambos estamos em superposição.',
          'Empate quântico! Nossos elétrons colidiram em harmonia.',
          'Nem mesmo o professor Stephen Hawking desempataria isso agora.',
        ];
        return phrases[_random.nextInt(phrases.length)];
    }
  }
}
