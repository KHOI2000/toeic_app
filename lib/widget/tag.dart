import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final Widget child;
  final Color color;

  const Tag({super.key, required this.child, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Center(
        child: child,
      ),
    );
  }
}
