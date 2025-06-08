import 'package:flutter/material.dart';

class GlowingButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const GlowingButton({super.key, required this.text, required this.onPressed});

  @override
  State<GlowingButton> createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: ElevatedButton(
              onPressed: widget.onPressed,
              style: ButtonStyle(
                backgroundColor: ButtonStyleButton.allOrNull(
                  _isHovered ? Colors.white : Colors.black87,
                ),
                foregroundColor: ButtonStyleButton.allOrNull(
                  _isHovered ? Colors.black87 : Colors.white,
                ),
                padding: ButtonStyleButton.allOrNull(
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                shape: ButtonStyleButton.allOrNull(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: _isHovered ? Colors.black87 : Colors.white,
                      width: 2.0,
                    ),
                  ),
                ),
                overlayColor: ButtonStyleButton.allOrNull(
                  Colors.white.withOpacity(0.1),
                ),
              ),
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 18,
                  shadows: [
                    Shadow(
                      color: _isHovered
                          ? Colors.black.withOpacity(0.7)
                          : Colors.white,
                      blurRadius: 15 * _scaleAnimation.value,
                    ),
                    Shadow(
                      color: _isHovered
                          ? Colors.black.withOpacity(0.4)
                          : Colors.white70,
                      blurRadius: 20 * _scaleAnimation.value,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
