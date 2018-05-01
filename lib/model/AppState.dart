import 'package:flutter_shopping_cart/model/CartItem.dart';

class AppState {
  static var empty = AppState(new List());

  final List<CartItem> cartItems;

  AppState(this.cartItems);

  @override
  String toString() => "$cartItems";
}
