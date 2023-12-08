import 'package:flutter/material.dart';
import 'package:nesto_hypermarket/view/customer/customer_screen.dart';
import 'package:nesto_hypermarket/view/home/screens/add_payment/add_payment_screen.dart';
import 'package:nesto_hypermarket/view/home/screens/products/screen/product.dart';
import 'package:nesto_hypermarket/view/home/screens/route/route.dart';
import 'package:nesto_hypermarket/view/home/screens/today_summery/todays_summery.dart';
// import 'package:nesto_hypermarket/view/home/screens/today's_order/todays_order.dart';
// import 'package:nesto_hypermarket/view/home/screens/today's_order/todays_order.dart';
import 'package:nesto_hypermarket/view/home/widget/header.dart';
import 'package:nesto_hypermarket/view/home/widget/home_card_widget.dart';
import 'package:nesto_hypermarket/view/new_order/new_order_screen.dart';
import 'package:nesto_hypermarket/view/return/return.dart';

import 'today_order/todays_order.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<HomeCards> _cards = [
    HomeCards(
        screens: const CustomerScreen(),
        icon: Icons.people,
        title: 'Customers'),
    HomeCards(screens: ProductScreen(), icon: Icons.gif_box, title: 'Products'),
    HomeCards(
        screens: const ScreenNewOrder(),
        icon: Icons.add_box_outlined,
        title: 'New Order'),
    HomeCards(
        screens: const ReturnScreen(),
        icon: Icons.web_asset_sharp,
        title: 'Return Order'),
    HomeCards(
        screens: const ScreenAddPayment(),
        icon: Icons.payment,
        title: 'Add Payment'),
    HomeCards(
        screens: TodayOrderScreen(),
        icon: Icons.card_membership,
        title: 'Today\'s Order'),
    HomeCards(
        screens: TodaysSummeryScreen(),
        icon: Icons.summarize,
        title: 'Today\'s Summery'),
    HomeCards(
        screens: RouteScreen(), icon: Icons.severe_cold_sharp, title: 'Route'),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderHomeScreen(size: size),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final crossAxisCount =
                            constraints.maxWidth > 600 ? 3 : 2;
                        const cardWidth = 200.0;
                        const cardHeight = 170.0;

                        return GridView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _cards.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: cardWidth / cardHeight,
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                          ),
                          itemBuilder: (context, index) {
                            return HomeCardWidget(
                              icon: _cards[index].icon,
                              cardWidth: cardWidth,
                              cardHeight: cardHeight,
                              name: _cards[index].title,
                              navigator: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => _cards[index].screens,
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeCards {
  Widget screens;
  IconData icon;
  String title;
  HomeCards({required this.screens, required this.icon, required this.title});
}
