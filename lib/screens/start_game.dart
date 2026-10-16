import 'dart:async';
import 'package:flutter/material.dart';
import '../models/game_move.dart';
import '../models/game_difficulty.dart';
import '../services/cpu_ai_service.dart';
import '../theme/app_theme.dart';
import '../widgets/battle_arena.dart';
import '../widgets/move_card.dart';
import '../widgets/difficulty_selector.dart';
import 'home_page.dart';
import 'over.dart';
import 'winner.dart';

class StartGame extends StatefulWidget {
  final GameDifficulty initialDifficulty;

  const StartGame({
    super.key,
    this.initialDifficulty = GameDifficulty.normal,
  });

  @override
  State<StartGame> createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> {
  late GameDifficulty _difficulty;
  late final CpuAiService _cpuAi;

  int _playerScore = 0;
  int _cpuScore = 0;
  int _round = 0;

  GameMove? _selectedPlayerMove;
  GameMove? _currentCpuMove;
  RoundWinner? _lastWinner;
  String _currentRuleDescription = '';
  String _currentSheldonDialogue = '';

  bool _isBattling = false;
  final int _targetPoints = 5;

  @override
  void initState() {
    super.initState();
    _difficulty = widget.initialDifficulty;
    _cpuAi = CpuAiService();
  }

  void _onPlayerSelectedMove(GameMove move) {
    if (_isBattling) return;

    setState(() {
      _isBattling = true;
      _selectedPlayerMove = move;
      _currentCpuMove = null;
      _lastWinner = null;
      _currentRuleDescription = 'Calculando variáveis quânticas...';
      _currentSheldonDialogue = '';
    });

    // Animação e suspense do duelo (700ms)
    Timer(const Duration(milliseconds: 700), () {
      if (!mounted) return;

      final cpuMove = _cpuAi.decideMove(_difficulty);
      final evaluation = _cpuAi.evaluateRound(move, cpuMove);

      setState(() {
        _isBattling = false;
        _round++;
        _currentCpuMove = cpuMove;
        _lastWinner = evaluation.winner;
        _currentRuleDescription = evaluation.ruleDescription;
        _currentSheldonDialogue = evaluation.banzingaDialogue;

        if (evaluation.winner == RoundWinner.player) {
          _playerScore++;
        } else if (evaluation.winner == RoundWinner.cpu) {
          _cpuScore++;
        }

        // Registra aprendizado na IA da CPU
        _cpuAi.recordRound(
          playerMove: move,
          cpuMove: cpuMove,
          winner: evaluation.winner,
        );
      });

      // Checa se alguém venceu a partida
      if (_playerScore >= _targetPoints) {
        Future.delayed(const Duration(milliseconds: 1000), () {
          if (!mounted) return;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Winner(
                difficulty: _difficulty,
                totalRounds: _round,
              ),
            ),
          );
        });
      } else if (_cpuScore >= _targetPoints) {
        Future.delayed(const Duration(milliseconds: 1000), () {
          if (!mounted) return;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Over(
                difficulty: _difficulty,
                totalRounds: _round,
              ),
            ),
          );
        });
      }
    });
  }

  void _changeDifficulty(GameDifficulty newDiff) {
    if (_isBattling) return;
    setState(() {
      _difficulty = newDiff;
      _cpuAi.resetGame();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Dificuldade alterada para: ${newDiff.title} (${newDiff.subtitle})',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: newDiff.color,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _confirmExit() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.primaryDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Sair da Partida?',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: const Text(
          'O progresso desta batalha atual será perdido. Deseja retornar ao menu principal?',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar', style: TextStyle(color: Colors.white60)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.accentBazingaRed),
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: const Text('Sair'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _confirmExit();
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: AppTheme.bgGradient,
          ),
          child: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Barra Superior com Informações e Saída
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back_ios_new_rounded,
                                    color: Colors.white70, size: 20),
                                onPressed: _confirmExit,
                              ),
                              DifficultySelector(
                                selectedDifficulty: _difficulty,
                                onDifficultyChanged: _changeDifficulty,
                                compact: true,
                              ),
                              IconButton(
                                icon: const Icon(Icons.refresh_rounded,
                                    color: Colors.white70, size: 22),
                                tooltip: 'Reiniciar Placar',
                                onPressed: () {
                                  setState(() {
                                    _playerScore = 0;
                                    _cpuScore = 0;
                                    _round = 0;
                                    _selectedPlayerMove = null;
                                    _currentCpuMove = null;
                                    _lastWinner = null;
                                    _currentRuleDescription = '';
                                    _currentSheldonDialogue = '';
                                    _cpuAi.resetGame();
                                  });
                                },
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          // Painel do Placar Responsivo
                          _buildScoreBoard(),

                          const SizedBox(height: 14),

                          // Arena Central do Duelo
                          BattleArena(
                            playerMove: _selectedPlayerMove,
                            cpuMove: _currentCpuMove,
                            isBattling: _isBattling,
                            difficulty: _difficulty,
                            ruleDescription: _currentRuleDescription,
                            sheldonQuote: _currentSheldonDialogue,
                            lastWinner: _lastWinner,
                          ),

                          const SizedBox(height: 16),

                          // Seção de Seleção do Jogador
                          Column(
                            children: [
                              Text(
                                _isBattling
                                    ? 'Aguarde o confronto...'
                                    : 'SUA VEZ: ESCOLHA UMA JOGADA',
                                style: TextStyle(
                                  color: _isBattling ? Colors.amber : Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              const SizedBox(height: 12),
                              // Grid/Scroll horizontal de botões de movimento
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: GameMove.values.map((move) {
                                      final isSelected =
                                          _selectedPlayerMove == move;
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 7),
                                        child: MoveCard(
                                          move: move,
                                          isSelected: isSelected,
                                          isEnabled: !_isBattling,
                                          size: 64,
                                          onTap: () => _onPlayerSelectedMove(move),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          // Rodapé com rodadas e regras
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.bolt_rounded,
                                  color: AppTheme.accentGold, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                'Primeiro a marcar $_targetPoints pontos vence!',
                                style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScoreBoard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Você
          _buildScoreItem(
            label: 'VOCÊ',
            score: _playerScore,
            color: Colors.greenAccent,
            icon: Icons.person_rounded,
          ),

          // Rodada Central
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'RODADA $_round',
                  style: const TextStyle(
                    color: AppTheme.accentGold,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Alvo: $_targetPoints pts',
                style: const TextStyle(
                  color: Colors.white38,
                  fontSize: 10,
                ),
              ),
            ],
          ),

          // Sheldon CPU
          _buildScoreItem(
            label: 'SHELDON',
            score: _cpuScore,
            color: const Color(0xFFFF5252),
            icon: Icons.smart_toy_rounded,
          ),
        ],
      ),
    );
  }

  Widget _buildScoreItem({
    required String label,
    required int score,
    required Color color,
    required IconData icon,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 14),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) =>
              ScaleTransition(scale: animation, child: child),
          child: Text(
            '$score',
            key: ValueKey<int>(score),
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w900,
              shadows: [
                Shadow(color: color.withOpacity(0.6), blurRadius: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}