import 'package:flutter/material.dart';

/// Botão com efeito de toque elástico, gradiente fluido e sombra estilizada
class BazingaButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData? icon;
  final Gradient? gradient;
  final Color? solidColor;
  final double width;
  final double height;
  final double fontSize;

  const BazingaButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.gradient,
    this.solidColor,
    this.width = double.infinity,
    this.height = 52,
    this.fontSize = 16,
  });

  @override
  State<BazingaButton> createState() => _BazingaButtonState();
}

class _BazingaButtonState extends State<BazingaButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() => _scale = 0.94);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _scale = 1.0);
  }

  void _onTapCancel() {
    setState(() => _scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _scale,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        onTap: widget.onPressed,
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            gradient: widget.solidColor == null
                ? (widget.gradient ??
                    const LinearGradient(
                      colors: [Color(0xFFE52521), Color(0xFFB71C1C)],
                    ))
                : null,
            color: widget.solidColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: (widget.solidColor ?? const Color(0xFFE52521))
                    .withOpacity(0.35),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(
                  widget.icon,
                  color: Colors.white,
                  size: widget.fontSize + 4,
                ),
                const SizedBox(width: 8),
              ],
              Flexible(
                child: Text(
                  widget.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
