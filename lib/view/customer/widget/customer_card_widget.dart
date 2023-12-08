import 'package:flutter/material.dart';
import 'package:nesto_hypermarket/view/customer/widget/circular_button_widget.dart';

class CustomerCardWidget extends StatelessWidget {
  const CustomerCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/Designer.jpeg'),
                ),
              ),
              width: 70,
              height: 80,
            ),
            const SizedBox(width: 6.0),
            Container(
              height: 65,
              width: 0.5,
              color: Colors.grey,
            ),
            const SizedBox(width: 10.0),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nesto HyperMarket',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'ID: D013DR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'West Palzai Calicut ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Due Amount: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' \$983',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularButton(
                    icon: Icons.phone, circleSize: 25, onPressed: () {}),
                IconButton(
                  icon: const Icon(
                    Icons.wechat,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
