import 'package:flutter/material.dart';
import '../models/game_move.dart';
import '../models/game_difficulty.dart';

/// Widget central que renderiza o duelo animado entre Jogador e Sheldon CPU
class BattleArena extends StatelessWidget {
  final GameMove? playerMove;
  final GameMove? cpuMove;
  final bool isBattling;
  final String? ruleDescription;
  final String? sheldonQuote;
  final RoundWinner? lastWinner;
  final GameDifficulty difficulty;

  const BattleArena({
    super.key,
    required this.playerMove,
    required this.cpuMove,
    required this.isBattling,
    required this.difficulty,
    this.ruleDescription,
    this.sheldonQuote,
    this.lastWinner,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardSize = (constraints.maxWidth * 0.28).clamp(80.0, 120.0);

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.08),
                Colors.white.withOpacity(0.02),
              ],
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withOpacity(0.12),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Linha do confronto (Jogador vs CPU)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Lado do Jogador
                  _buildFighterSide(
                    label: 'VOCÊ',
                    move: playerMove,
                    isWinner: lastWinner == RoundWinner.player,
                    size: cardSize,
                    placeholderAsset: 'assets/images/vazio.jpg',
                    isBattling: isBattling,
                  ),

                  // Elemento central "VS" / Status
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFE52521), Color(0xFFFF9800)],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFE52521).withOpacity(0.5),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: const Text(
                          'VS',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      if (isBattling)
                        const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.amber),
                          ),
                        )
                      else if (lastWinner != null)
                        _buildWinnerBadge(lastWinner!),
                    ],
                  ),

                  // Lado da CPU (Sheldon Bot)
                  _buildFighterSide(
                    label: 'SHELDON BOT',
                    subtitle: difficulty.title,
                    move: cpuMove,
                    isWinner: lastWinner == RoundWinner.cpu,
                    size: cardSize,
                    placeholderAsset: 'assets/images/vazio.jpg',
                    isBattling: isBattling,
                    isCpu: true,
                  ),
                ],
              ),

              // Banner da regra executada na rodada
              if (!isBattling && ruleDescription != null && ruleDescription!.isNotEmpty) ...[
                const SizedBox(height: 14),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: _getResultBgColor(lastWinner),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: _getResultBorderColor(lastWinner),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _getResultIcon(lastWinner),
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          ruleDescription!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              // Citação cômica de Sheldon Cooper (Bazinga!)
              if (!isBattling && sheldonQuote != null && sheldonQuote!.isNotEmpty) ...[
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.chat_bubble_outline_rounded,
                        size: 14,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          sheldonQuote!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.amberAccent,
                            fontSize: 11.5,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildFighterSide({
    required String label,
    String? subtitle,
    required GameMove? move,
    required bool isWinner,
    required double size,
    required String placeholderAsset,
    required bool isBattling,
    bool isCpu = false,
  }) {
    final borderColor = isWinner
        ? Colors.greenAccent
        : (isBattling
            ? Colors.amber
            : (move != null ? move.accentColor : Colors.white24));

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: borderColor,
              width: isWinner ? 3.5 : 2.0,
            ),
            boxShadow: [
              BoxShadow(
                color: borderColor.withOpacity(isWinner ? 0.6 : 0.3),
                blurRadius: isWinner ? 16 : 8,
                spreadRadius: isWinner ? 2 : 0,
              ),
            ],
          ),
          child: ClipOval(
            child: Padding(
              padding: EdgeInsets.all(size * 0.15),
              child: isBattling && isCpu
                  ? const Center(
                      child: Text(
                        '?',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF272362),
                        ),
                      ),
                    )
                  : Image.asset(
                      move?.assetPath ?? placeholderAsset,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          isCpu ? Icons.smart_toy : Icons.person,
                          size: size * 0.5,
                          color: const Color(0xFF272362),
                        );
                      },
                    ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 13,
            letterSpacing: 0.5,
          ),
        ),
        if (subtitle != null)
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 10,
            ),
          ),
        if (move != null && !isBattling)
          Text(
            move.nome,
            style: TextStyle(
              color: move.accentColor,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
      ],
    );
  }

  Widget _buildWinnerBadge(RoundWinner winner) {
    Color color;
    String text;

    switch (winner) {
      case RoundWinner.player:
        color = Colors.greenAccent;
        text = 'Ponto Seu!';
        break;
      case RoundWinner.cpu:
        color = const Color(0xFFFF5252);
        text = 'Ponto da CPU!';
        break;
      case RoundWinner.tie:
        color = Colors.amberAccent;
        text = 'Empate!';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.6)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Color _getResultBgColor(RoundWinner? winner) {
    switch (winner) {
      case RoundWinner.player:
        return const Color(0xFF2E7D32).withOpacity(0.5);
      case RoundWinner.cpu:
        return const Color(0xFFC62828).withOpacity(0.5);
      case RoundWinner.tie:
      default:
        return const Color(0xFFF57F17).withOpacity(0.5);
    }
  }

  Color _getResultBorderColor(RoundWinner? winner) {
    switch (winner) {
      case RoundWinner.player:
        return Colors.greenAccent;
      case RoundWinner.cpu:
        return Colors.redAccent;
      case RoundWinner.tie:
      default:
        return Colors.amberAccent;
    }
  }

  IconData _getResultIcon(RoundWinner? winner) {
    switch (winner) {
      case RoundWinner.player:
        return Icons.check_circle_rounded;
      case RoundWinner.cpu:
        return Icons.cancel_rounded;
      case RoundWinner.tie:
      default:
        return Icons.handshake_rounded;
    }
  }
}
