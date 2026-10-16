import 'package:flutter/material.dart';
import '../models/game_difficulty.dart';
import '../theme/app_theme.dart';
import '../widgets/bazinga_button.dart';
import 'home_page.dart';
import 'start_game.dart';

class Winner extends StatelessWidget {
  final GameDifficulty difficulty;
  final int totalRounds;

  const Winner({
    super.key,
    this.difficulty = GameDifficulty.normal,
    this.totalRounds = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.victoryGradient,
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Título e Troféu
                        Column(
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              'PARABÉNS!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppTheme.accentGold,
                                fontWeight: FontWeight.w900,
                                fontSize: 36,
                                letterSpacing: 2,
                                shadows: [
                                  Shadow(
                                    color: Colors.black45,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'Você derrotou o Sheldon Bot!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: (constraints.maxHeight * 0.28).clamp(130.0, 200.0),
                              ),
                              child: Image.asset(
                                'assets/images/trofeu.png',
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.emoji_events_rounded,
                                    size: 110,
                                    color: AppTheme.accentGold,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),

                        // Estatísticas e Humor Geek
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white.withOpacity(0.15)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  _buildStat('Dificuldade', difficulty.title, difficulty.color),
                                  _buildStat('Rodadas', '$totalRounds', AppTheme.accentGold),
                                  _buildStat('Resultado', '5 x Sheldon', Colors.greenAccent),
                                ],
                              ),
                              const Divider(color: Colors.white24, height: 24),
                              const Text(
                                '"Bazinga! Parece que as variáveis quânticas estavam a seu favor nesta dimensão!"',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 12.5,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Botões de Ação
                        Column(
                          children: [
                            BazingaButton(
                              label: 'JOGAR NOVAMENTE',
                              icon: Icons.replay_rounded,
                              solidColor: const Color(0xFF2E7D32),
                              height: 50,
                              fontSize: 15,
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StartGame(
                                      initialDifficulty: difficulty,
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 12),
                            BazingaButton(
                              label: 'MENU PRINCIPAL',
                              icon: Icons.home_rounded,
                              solidColor: Colors.white.withOpacity(0.15),
                              height: 48,
                              fontSize: 14,
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 10),
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
    );
  }

  Widget _buildStat(String title, String value, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}