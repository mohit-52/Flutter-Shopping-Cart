import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/cart_provider.dart';
import 'package:shopping_cart/product_list.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(
        builder: (BuildContext) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: ProductListScreen(),
          );
        },
      ),
    );
  }
}
