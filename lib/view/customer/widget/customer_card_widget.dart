import 'package:flutter/material.dart';
import 'package:nesto_hypermarket/model/customer_model.dart';
import 'package:nesto_hypermarket/view/customer/widget/circular_button_widget.dart';

class CustomerCardWidget extends StatelessWidget {
  const CustomerCardWidget({
    super.key,
    required this.customer,
  });
  final CustomerData customer;
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
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(customer.profilePic ??
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToIMut-4h-8WCeoCGcr_-REk1il2Xt1btjrw&usqp=CAU'),
                ),
              ),
              width: 70,
              height: 80,
            ),
            const SizedBox(width: 6.0),
            Container(
              height: 75,
              width: 0.5,
              color: Colors.grey,
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    customer.name ?? 'name',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'ID: IDO${customer.id}DR',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '${customer.street} ${customer.city} ${customer.country}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const Row(
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
