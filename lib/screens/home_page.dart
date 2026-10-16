import 'package:flutter/material.dart';
import '../models/game_difficulty.dart';
import '../theme/app_theme.dart';
import '../widgets/bazinga_button.dart';
import '../widgets/difficulty_selector.dart';
import 'rules_page.dart';
import 'start_game.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  GameDifficulty _selectedDifficulty = GameDifficulty.normal;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.98, end: 1.03).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Topo Temático com logo
                        Column(
                          children: [
                            SizedBox(
                              height: (constraints.maxHeight * 0.16).clamp(80.0, 140.0),
                              child: Image.asset(
                                'assets/images/topo.png',
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return const SizedBox.shrink();
                                },
                              ),
                            ),
                            const SizedBox(height: 12),
                            ScaleTransition(
                              scale: _pulseAnimation,
                              child: Container(
                                constraints: BoxConstraints(
                                  maxHeight: (constraints.maxHeight * 0.20).clamp(110.0, 160.0),
                                ),
                                child: Image.asset(
                                  'assets/images/logo.png',
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Text(
                                      'BAZINGA!',
                                      style: TextStyle(
                                        color: AppTheme.accentBazingaRed,
                                        fontSize: 38,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 2,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Pedra • Papel • Tesoura • Lagarto • Spock',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),

                        // Seleção de Engenharia de Dificuldade
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.06),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white.withOpacity(0.12)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.tune_rounded, color: AppTheme.accentGold, size: 18),
                                  SizedBox(width: 8),
                                  Text(
                                    'Dificuldade da CPU:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              DifficultySelector(
                                selectedDifficulty: _selectedDifficulty,
                                onDifficultyChanged: (newDiff) {
                                  setState(() => _selectedDifficulty = newDiff);
                                },
                              ),
                              const SizedBox(height: 10),
                              Text(
                                _selectedDifficulty.description,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 11.5,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Botões de Ação
                        Column(
                          children: [
                            BazingaButton(
                              label: 'INICIAR O JOGO',
                              icon: Icons.play_arrow_rounded,
                              gradient: AppTheme.bazingaButtonGradient,
                              height: 52,
                              fontSize: 16,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StartGame(
                                      initialDifficulty: _selectedDifficulty,
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 12),
                            BazingaButton(
                              label: 'REGRAS DO JOGO',
                              icon: Icons.menu_book_rounded,
                              gradient: AppTheme.rulesButtonGradient,
                              height: 48,
                              fontSize: 15,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RulesPage(),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'The Big Bang Theory • Edição Especial',
                              style: TextStyle(
                                color: Colors.white24,
                                fontSize: 11,
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
    );
  }
}