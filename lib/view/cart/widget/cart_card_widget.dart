import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListTile(
        title: const Text(
          'Kashmir Kiwi | 250g',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: const Text('\$ 200'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.remove,
                    size: 15,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                const Text(
                  '3',
                  style: TextStyle(color: Colors.black),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add,
                    size: 15,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                CupertinoButton(
                  onPressed: () {},
                  child: const Icon(
                    CupertinoIcons.delete_solid,
                    size: 18,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
