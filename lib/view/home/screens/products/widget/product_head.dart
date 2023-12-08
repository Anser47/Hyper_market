import 'package:flutter/material.dart';

class ProducetScreenHeadWidget extends StatelessWidget {
  const ProducetScreenHeadWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 12,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          const SizedBox(
            width: 65,
          ),
          const Text(
            "Nesto Hypermarket",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            width: 65,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          )
        ],
      ),
    );
  }
}
