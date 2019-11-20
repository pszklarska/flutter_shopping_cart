import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/redux/store.dart';
import 'package:flutter_shopping_cart/main/shopping_cart_app.dart';

void main() async {
  final store = await createReduxStore();
  runApp(ShoppingCartApp(store));
}
