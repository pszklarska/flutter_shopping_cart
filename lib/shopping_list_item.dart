import 'package:flutter/material.dart';

class ShoppingListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text('TODO: Shopping Item Name'),
      leading: new Checkbox(value: true, onChanged: null),
    );
  }
}
