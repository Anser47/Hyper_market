import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nesto_hypermarket/view/common/widget/product_head.dart';

import '../widget/cart_card_widget.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  String nestoHeading = '''          Your Cart 
Nesto HyperMarket''';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProducetScreenHeadWidget(size: size, name: nestoHeading),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return const CartCard();
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 0,
                  );
                },
                itemCount:
                    12, // Replace with the actual number of items in your cart
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[200],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal'),
                      Text('\$200.00'),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tax'),
                      Text('\$20.00'),
                    ],
                  ),
                  const Divider(height: 20, thickness: 1),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$220.00',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 4, 66, 117),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Order',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 4, 66, 117),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Order and Deliver',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
