import 'package:flutter/material.dart';

import '../../../../../model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductData productModel;

  const ProductCard({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      elevation: 12,
      child: Container(
        width: 240,
        height: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(productModel.image ?? ''),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
              ),
              height: 110,
              width: 240,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productModel.name ?? 'Name',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 60,
                ),
                Container(
                  height: 35,
                  width: 1,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 7,
                ),
                Container(
                  height: 23,
                  width: 43,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 8, 81, 140),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
