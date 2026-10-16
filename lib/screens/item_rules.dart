import 'package:flutter/material.dart';
import '../models/game_move.dart';
import '../theme/app_theme.dart';

/// Modelo de regra canônica de The Big Bang Theory
class CanonicalRule {
  final GameMove winner;
  final String actionVerb;
  final GameMove loser;

  const CanonicalRule({
    required this.winner,
    required this.actionVerb,
    required this.loser,
  });
}

class ItemRules extends StatefulWidget {
  const ItemRules({super.key});

  @override
  State<ItemRules> createState() => _ItemRulesState();
}

class _ItemRulesState extends State<ItemRules> {
  GameMove? _filterMove;

  // As 10 regras canônicas descritas por Sheldon Cooper
  final List<CanonicalRule> _allRules = const [
    CanonicalRule(winner: GameMove.tesoura, actionVerb: 'corta', loser: GameMove.papel),
    CanonicalRule(winner: GameMove.papel, actionVerb: 'cobre', loser: GameMove.pedra),
    CanonicalRule(winner: GameMove.pedra, actionVerb: 'esmaga', loser: GameMove.lagarto),
    CanonicalRule(winner: GameMove.lagarto, actionVerb: 'envenena', loser: GameMove.spock),
    CanonicalRule(winner: GameMove.spock, actionVerb: 'esmaga', loser: GameMove.tesoura),
    CanonicalRule(winner: GameMove.tesoura, actionVerb: 'decapita', loser: GameMove.lagarto),
    CanonicalRule(winner: GameMove.lagarto, actionVerb: 'devora', loser: GameMove.papel),
    CanonicalRule(winner: GameMove.papel, actionVerb: 'refuta', loser: GameMove.spock),
    CanonicalRule(winner: GameMove.spock, actionVerb: 'vaporiza', loser: GameMove.pedra),
    CanonicalRule(winner: GameMove.pedra, actionVerb: 'quebra', loser: GameMove.tesoura),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredRules = _filterMove == null
        ? _allRules
        : _allRules
            .where((r) => r.winner == _filterMove || r.loser == _filterMove)
            .toList();

    return Column(
      children: [
        // Cabeçalho explicativo
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              const Text(
                'REGRAS DO SHELDON',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.accentGold,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Primeiro a atingir 5 pontos vence o duelo mental.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
              const SizedBox(height: 14),

              // Filtro rápido por elemento
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    _buildFilterChip(null, 'Todas'),
                    ...GameMove.values.map((move) => _buildFilterChip(move, move.nome)),
                  ],
                ),
              ),
            ],
          ),
        ),

        const Divider(color: Colors.white12, height: 1),

        // Lista dinâmica de regras com cards ilustrados
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: filteredRules.length + 1,
            itemBuilder: (context, index) {
              if (index == filteredRules.length) {
                // Banner ilustrado no fim da lista
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/regras.png',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const SizedBox.shrink(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '"Tesoura corta papel, papel cobre pedra, pedra esmaga lagarto, lagarto envenena Spock, Spock esmaga tesoura, tesoura decapita lagarto, lagarto devora papel, papel refuta Spock, Spock vaporiza pedra e, como sempre, pedra quebra tesoura!"\n— Sheldon Cooper',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                );
              }

              final rule = filteredRules[index];
              return _buildRuleCard(rule);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(GameMove? move, String label) {
    final isSelected = _filterMove == move;
    final color = move?.accentColor ?? AppTheme.accentGold;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black87 : Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            fontSize: 12,
          ),
        ),
        selected: isSelected,
        selectedColor: color,
        backgroundColor: Colors.white.withOpacity(0.08),
        checkmarkColor: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: isSelected ? color : Colors.white24,
          ),
        ),
        onSelected: (_) {
          setState(() => _filterMove = move);
        },
      ),
    );
  }

  Widget _buildRuleCard(CanonicalRule rule) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Vencedor
          _buildElementPreview(rule.winner, isWinner: true),

          // Verbo da Regra
          Flexible(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: rule.winner.accentColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: rule.winner.accentColor.withOpacity(0.5),
                ),
              ),
              child: Text(
                rule.actionVerb.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: rule.winner.accentColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 12,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),

          // Perdedor
          _buildElementPreview(rule.loser, isWinner: false),
        ],
      ),
    );
  }

  Widget _buildElementPreview(GameMove move, {required bool isWinner}) {
    final color = isWinner ? move.accentColor : Colors.white30;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: color,
              width: isWinner ? 2.5 : 1.0,
            ),
            boxShadow: isWinner
                ? [
                    BoxShadow(
                      color: move.accentColor.withOpacity(0.4),
                      blurRadius: 8,
                    )
                  ]
                : [],
          ),
          child: ClipOval(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                move.assetPath,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          move.nome,
          style: TextStyle(
            color: isWinner ? Colors.white : Colors.white54,
            fontWeight: isWinner ? FontWeight.bold : FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}