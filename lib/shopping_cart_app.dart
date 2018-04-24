import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/shopping_list.dart';

class ShoppingCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ShoppingCart',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('ShoppingCart'),
        ),
        body: new ShoppingList(),
      ),
    );
  }
}
