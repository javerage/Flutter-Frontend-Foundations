import 'dart:math';
import 'package:flutter/material.dart';

class LoadingBorderButton extends StatefulWidget {
  final bool isLoading;
  final VoidCallback? onPressed;
  final Widget child;

  const LoadingBorderButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.child,
  });

  @override
  State<LoadingBorderButton> createState() => _LoadingBorderButtonState();
}

class _LoadingBorderButtonState extends State<LoadingBorderButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    if (widget.isLoading) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(LoadingBorderButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLoading != oldWidget.isLoading) {
      if (widget.isLoading) {
        _controller.repeat();
      } else {
        _controller.stop();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomPaint(
      painter: _BorderPainter(
        animation: _controller,
        isLoading: widget.isLoading,
        color: theme.colorScheme.primary,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: widget.isLoading
              ? theme.colorScheme.secondaryContainer
              : theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
        onPressed: widget.isLoading ? null : widget.onPressed,
        child: widget.child,
      ),
    );
  }
}

class _BorderPainter extends CustomPainter {
  final Animation<double> animation;
  final bool isLoading;
  final Color color;

  _BorderPainter({
    required this.animation,
    required this.isLoading,
    required this.color,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    if (!isLoading) return;

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(size.height / 2));

    final paint = Paint()
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..shader = SweepGradient(
        colors: [Colors.transparent, color],
        stops: const [0.5, 1.0],
        startAngle: -pi / 2,
        endAngle: pi * 2,
        transform: GradientRotation(animation.value * 2 * pi),
      ).createShader(rect);

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant _BorderPainter oldDelegate) {
    return isLoading != oldDelegate.isLoading || color != oldDelegate.color;
  }
}
