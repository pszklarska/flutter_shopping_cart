import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_shopping_cart/model/app_state.dart';
import 'package:redux/redux.dart';

class BottomCartBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
      converter: (Store<AppState> store) =>
          store.state.cartItems.where((item) => item.checked).length,
      builder: (BuildContext context, int cartItemsLength) {
        return Container(
          color: Colors.grey[800],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Text(
                  '$cartItemsLength selected items',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
