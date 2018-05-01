import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_shopping_cart/model/AppState.dart';
import 'package:flutter_shopping_cart/model/CartItem.dart';
import 'package:flutter_shopping_cart/redux/actions.dart';

class ShoppingListItem extends StatelessWidget {
  final CartItem item;

  ShoppingListItem(this.item);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(item.name),
      leading: new StoreConnector<AppState, OnStateChanged>(converter: (store) {
        return (item) => store.dispatch(ToggleItemStateAction(item));
      }, builder: (context, callback) {
        return new Checkbox(
            value: item.checked,
            onChanged: (bool newValue) {
              callback(CartItem(item.name, newValue));
            });
      }),
      trailing: new StoreConnector<AppState, OnRemoveIconClicked>(
        converter: (store) {
          return (item) => store.dispatch(RemoveItemAction(item));
        },
        builder: (context, callback) {
          return new IconButton(
            icon: new Icon(Icons.delete),
            onPressed: () {
              callback(CartItem(item.name, item.checked));
            },
          );
        },
      ),
    );
  }
}

typedef OnStateChanged = Function(CartItem item);

typedef OnRemoveIconClicked = Function(CartItem item);
