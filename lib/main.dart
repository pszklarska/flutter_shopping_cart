import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/redux/store.dart';
import 'package:flutter_shopping_cart/shopping_cart_app.dart';

void main() {
  final store = createReduxStore();
  runApp(ShoppingCartApp(store));
}
