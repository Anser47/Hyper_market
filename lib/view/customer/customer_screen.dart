import 'package:flutter/material.dart';
import 'package:nesto_hypermarket/provider/customer_screen_provider/customer_provider.dart';
import 'package:nesto_hypermarket/view/common/widget/product_head.dart';
import 'package:nesto_hypermarket/view/customer/widget/searchfield.dart';
import 'package:provider/provider.dart';
import 'widget/customer_card_widget.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProducetScreenHeadWidget(size: size, name: "Customers  "),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchWidget(bottomSheet: () {
                  context.read<CustomerPovider>().showBottomSheet(context);
                }),
              ),
              // OrderCard(),
              ListView.separated(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  separatorBuilder: (context, k) {
                    return const SizedBox(
                      height: 5,
                    );
                  },
                  itemBuilder: (context, index) {
                    return const CustomerCardWidget();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
