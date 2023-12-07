import 'package:flutter/material.dart';

class HomeCardWidget extends StatelessWidget {
  HomeCardWidget(
      {super.key,
      required this.cardWidth,
      required this.cardHeight,
      required this.navigator,
      required this.name,
      required this.icon});
  VoidCallback navigator;
  final double cardWidth;
  final double cardHeight;
  final String name;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigator,
      child: Card(
        elevation: 10,
        child: Container(
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 60,
                  color: Color.fromARGB(255, 4, 85, 151),
                ),
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
