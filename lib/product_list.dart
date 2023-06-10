import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        centerTitle: true,
        actions: [
         Center(
           child: Badge(
             label: Text('0'),
             child: Icon(Icons.shopping_bag),
           ),
         ),

          SizedBox(width: 20,)
        ],
      ),
    );
  }
}
