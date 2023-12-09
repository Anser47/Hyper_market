import 'package:flutter/material.dart';
import 'package:nesto_hypermarket/provider/common/bottomnavigationbar_provider.dart';
import 'package:nesto_hypermarket/provider/customer_screen_provider/customer_provider.dart';
import 'package:nesto_hypermarket/provider/product_provider/product_provider.dart';
import 'package:nesto_hypermarket/view/common/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomerPovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(),
      ),
    );
  }
}
