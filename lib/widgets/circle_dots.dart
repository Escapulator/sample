import 'package:flutter/material.dart';

class CircleDot extends StatelessWidget {
  final bool active;
  const CircleDot({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: 8,
      width: 8,
      decoration: BoxDecoration(shape: BoxShape.circle, color: active ? Color(0xFF08A227) : Color(0xFFE9E7E5)),
    );
  }
}
