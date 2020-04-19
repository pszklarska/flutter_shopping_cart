import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/add_item_dialog.dart';
import 'package:flutter_shopping_cart/cart_item.dart';

void main() => runApp(
      MaterialApp(
        title: 'ShoppingCart',
        home: ShoppingCartApp(),
      ),
    );

class ShoppingCartApp extends StatefulWidget {
  @override
  _ShoppingCartAppState createState() => _ShoppingCartAppState();
}

class _ShoppingCartAppState extends State<ShoppingCartApp> {
  List<CartItem> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShoppingCart'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, position) {
          final CartItem cartItem = items[position];
          return ListTile(
            title: Text(cartItem.name),
            leading: Checkbox(
              value: cartItem.checked,
              onChanged: (newValue) => _onCartItemChanged(cartItem),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddItemDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _onCartItemChanged(CartItem cartItem) {
    setState(() {
      items = items
          .map((item) => item.name == cartItem.name
              ? CartItem(cartItem.name, !item.checked)
              : item)
          .toList();
    });
  }

  Future _showAddItemDialog(BuildContext context) async {
    final String newCartItemName = await showDialog<String>(
      context: context,
      builder: (context) => AddItemDialog(),
    );
    if (newCartItemName != null) {
      setState(() {
        items = items..add(CartItem(newCartItemName, false));
      });
    }
  }
}
