import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/shopping_list_item.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: 10,
        itemBuilder: (context, position) => new ShoppingListItem());
  }
}
