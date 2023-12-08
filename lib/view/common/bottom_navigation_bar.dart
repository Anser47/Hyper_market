import 'package:flutter/material.dart';
import 'package:nesto_hypermarket/cart/screens/cart_screen.dart';
import 'package:nesto_hypermarket/view/customer/customer_screen.dart';
import 'package:nesto_hypermarket/view/home/screens/home_screen.dart';
import 'package:nesto_hypermarket/view/new_order/new_order_screen.dart';
import 'package:nesto_hypermarket/view/return/return.dart';
import 'package:provider/provider.dart';
import '../../provider/common/bottomnavigationbar_provider.dart';

class Page {
  final IconData icon;
  final String title;
  Widget screens;
  Page({required this.icon, required this.title, required this.screens});
}

class MyHomePage extends StatelessWidget {
  final List<Page> pages = [
    Page(
        icon: Icons.restore_page_outlined,
        title: 'Home',
        screens: HomeScreen()),
    Page(icon: Icons.add, title: 'New Order', screens: const ScreenNewOrder()),
    Page(icon: Icons.shopping_cart, title: 'Cart', screens: CartScreen()),
    Page(
        icon: Icons.undo, title: 'Return Order', screens: const ReturnScreen()),
    Page(
        icon: Icons.people, title: 'Customer', screens: const CustomerScreen()),
  ];
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context);

    return Scaffold(
      body: pages[pageProvider.currentIndex].screens,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 15,
        showUnselectedLabels: true,
        currentIndex: pageProvider.currentIndex,
        onTap: (index) {
          pageProvider.setIndex(index);
        },
        items: pages
            .map(
              (page) => BottomNavigationBarItem(
                icon: Icon(page.icon),
                label: page.title,
              ),
            )
            .toList(),
        selectedItemColor: Color.fromARGB(255, 4, 85, 151),
        unselectedItemColor: const Color.fromARGB(255, 7, 89, 155),
      ),
    );
  }
}
