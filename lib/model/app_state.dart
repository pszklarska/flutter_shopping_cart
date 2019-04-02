import 'package:flutter_shopping_cart/model/cart_item.dart';

class AppState {
  static var empty = AppState(new List());

  final List<CartItem> cartItems;

  AppState(this.cartItems);

  AppState.fromJson(Map<String, dynamic> json)
      : cartItems = (json['cartItems'] as List)
            .map((i) => new CartItem.fromJson(i as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {'cartItems': cartItems};

  @override
  String toString() => "$cartItems";
}
