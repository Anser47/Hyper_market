import 'package:flutter/material.dart';

class ProductDiscription extends StatelessWidget {
  const ProductDiscription({
    super.key,
    required this.name,
    required this.price,
    required this.img,
    required this.id,
  });
  final String name;
  final int price;
  final String img;
  final int id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text(
            'Product discription',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Discription(
          img: img,
          name: name,
          price: price,
          id: id,
        ),
      ),
    );
  }
}

class Discription extends StatelessWidget {
  const Discription({
    super.key,
    required this.img,
    required this.name,
    required this.price,
    required this.id,
  });
  final int id;
  final String img;
  final String name;
  final int price;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: constraints.maxWidth,
                height: 400,
                child: Image.network(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 12),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 12),
                child: Row(
                  children: [
                    Text(
                      '₹$price',
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
