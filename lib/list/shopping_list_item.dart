import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/model/CartItem.dart';

class ShoppingListItem extends StatelessWidget {
  final CartItem item;

  ShoppingListItem(this.item);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(item.name),
      leading: new Checkbox(value: item.checked, onChanged: null),
    );
  }
}
