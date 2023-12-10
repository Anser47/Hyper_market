import 'package:flutter/material.dart';

import '../../../../../model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductResponse product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('http://62.72.44.247${product.image}'),
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name ?? 'Name',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 35,
                    width: 1,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Expanded(
                    child: Container(
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
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('\$ ${product.price}/-'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
