import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/add_item_dialog.dart';
import 'package:flutter_shopping_cart/shopping_list.dart';

class ShoppingCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ShoppingCart',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ShoppingCart(),
    );
  }
}

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ShoppingCart'),
      ),
      body: new ShoppingList(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _openAddItemDialog(context),
        child: new Icon(Icons.add),
      ),
    );
  }
}

_openAddItemDialog(BuildContext context) {
  showDialog(
      context: context, builder: (context) => new AddItemDialog());
}
