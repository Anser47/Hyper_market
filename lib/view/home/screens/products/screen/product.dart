import 'package:flutter/material.dart';
import 'package:nesto_hypermarket/view/home/screens/products/widget/product_card.dart';
import 'package:nesto_hypermarket/view/home/screens/products/widget/searchTextfield.dart';
import '../../../../common/widget/product_head.dart';
import 'package:flutter/cupertino.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({
    Key? key,
  }) : super(key: key);

  final List<Product> products = [
    Product(name: 'Product 1', imageUrl: 'assets/product1.jpg'),
    Product(name: 'Product 2', imageUrl: 'assets/product2.jpg'),
    Product(name: 'Product 3', imageUrl: 'assets/product3.jpg'),
    Product(name: 'Product 3', imageUrl: 'assets/product3.jpg'),
    Product(name: 'Product 3', imageUrl: 'assets/product3.jpg'),
    Product(name: 'Product 3', imageUrl: 'assets/product3.jpg'),
    Product(name: 'Product 3', imageUrl: 'assets/product3.jpg'),
    Product(name: 'Product 3', imageUrl: 'assets/product3.jpg'),
    Product(name: 'Product 3', imageUrl: 'assets/product3.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: size.height, // Set a height constraint
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProducetScreenHeadWidget(size: size, name: "Nesto Hypermarket"),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: const SearchfiledWidget(),
                  ),
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: size.width > 600 ? 4 : 2,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ProductCard(product: products[index]),
                    );
                  },
                ),
                // MyHomePage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
