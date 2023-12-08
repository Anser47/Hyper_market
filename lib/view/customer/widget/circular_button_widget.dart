import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final IconData icon;
  final double circleSize;
  final VoidCallback onPressed;

  CircularButton({
    required this.icon,
    required this.circleSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: circleSize,
        height: circleSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color.fromARGB(255, 7, 86, 151),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
