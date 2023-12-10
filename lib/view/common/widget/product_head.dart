import 'package:flutter/material.dart';
import 'package:nesto_hypermarket/view/common/bottom_navigation_bar.dart';

class ProducetScreenHeadWidget extends StatelessWidget {
  ProducetScreenHeadWidget({
    Key? key,
    required this.size,
    required this.name,
  }) : super(key: key);

  String name;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 12,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyHomePage()));
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          const SizedBox(
            width: 5,
          ), // Adjust as needed
          Expanded(
            child: Center(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}
