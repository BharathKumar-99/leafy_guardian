import 'package:flutter/material.dart';
import 'dart:math' as math;

class HalfCircularListView extends StatelessWidget {
  final List<Widget> children;
  final double radius;
  final double itemSize;

  const HalfCircularListView({
    super.key,
    required this.children,
    this.radius = 100.0,
    this.itemSize = 50.0,
  }) : assert(children.length == 3,
            'HalfCircularListView requires exactly 3 children.');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 2,
      height: radius,
      child: Stack(
        alignment: Alignment.center,
        children: _buildHalfCircularItems(),
      ),
    );
  }

  List<Widget> _buildHalfCircularItems() {
    final List<Widget> items = [];
    final angles = [math.pi, math.pi / 2, 0];

    for (int i = 0; i < children.length; i++) {
      final angle = angles[i];
      final x = radius + radius * math.cos(angle) - itemSize / 2;
      final y = radius * math.sin(angle) - itemSize / 2;

      items.add(Positioned(
        left: x,
        top: y,
        child: SizedBox(
          width: itemSize,
          height: itemSize,
          child: children[i],
        ),
      ));
    }

    return items;
  }
}
