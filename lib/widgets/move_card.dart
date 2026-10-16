import 'package:flutter/material.dart';
import '../models/game_move.dart';

/// Card interativo para seleção de movimento do jogador com micro-animação
class MoveCard extends StatefulWidget {
  final GameMove move;
  final bool isSelected;
  final bool isEnabled;
  final VoidCallback onTap;
  final double size;

  const MoveCard({
    super.key,
    required this.move,
    required this.isSelected,
    required this.onTap,
    this.isEnabled = true,
    this.size = 72,
  });

  @override
  State<MoveCard> createState() => _MoveCardState();
}

class _MoveCardState extends State<MoveCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 140),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.92).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.move.accentColor;

    return GestureDetector(
      onTapDown: widget.isEnabled ? (_) => _controller.forward() : null,
      onTapUp: widget.isEnabled
          ? (_) {
              _controller.reverse();
              widget.onTap();
            }
          : null,
      onTapCancel: widget.isEnabled ? () => _controller.reverse() : null,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: widget.isSelected ? color : Colors.white.withOpacity(0.8),
                  width: widget.isSelected ? 3.5 : 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: widget.isSelected
                        ? color.withOpacity(0.7)
                        : Colors.black.withOpacity(0.3),
                    blurRadius: widget.isSelected ? 14 : 6,
                    spreadRadius: widget.isSelected ? 3 : 1,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipOval(
                child: Padding(
                  padding: EdgeInsets.all(widget.size * 0.16),
                  child: Image.asset(
                    widget.move.assetPath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.smart_toy_outlined,
                        color: color,
                        size: widget.size * 0.45,
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.move.nome,
              style: TextStyle(
                color: widget.isSelected ? color : Colors.white,
                fontWeight: widget.isSelected ? FontWeight.bold : FontWeight.w600,
                fontSize: 12,
                shadows: widget.isSelected
                    ? [
                        Shadow(
                          color: color.withOpacity(0.8),
                          blurRadius: 6,
                        ),
                      ]
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
