import 'package:flutter/material.dart';

class Product {
  final String name;
  final String imageUrl;

  Product({required this.name, required this.imageUrl});
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

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
        // Adjust the height as needed

        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/Designer.jpeg',
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7), topRight: Radius.circular(7)),
              ),
              height: 110, // Adjust the height as needed
              width: 240,
              // child: Image.asset(
              //   'assets/images/Designer.jpeg',
              //   fit: BoxFit.cover,
              // ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text('\$ 300/-'),
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
                    borderRadius: BorderRadius.all(Radius.circular(
                      4,
                    )),
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
