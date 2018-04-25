import 'package:flutter/material.dart';

class ShoppingListItem extends StatelessWidget {
  final String itemName;

  ShoppingListItem(this.itemName);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(itemName),
      leading: new Checkbox(value: true, onChanged: null),
    );
  }
}
