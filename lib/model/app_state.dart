import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_cart/model/cart_item.dart';

class AppState extends Equatable {
  final List<CartItem> cartItems;

  AppState(this.cartItems);

  AppState.fromJson(Map<String, dynamic> json)
      : cartItems = (json['cartItems'] as List)
            .map((i) => new CartItem.fromJson(i as Map<String, dynamic>))
            .toList();

  factory AppState.empty() => AppState(new List());

  Map<String, dynamic> toJson() => {'cartItems': cartItems};

  @override
  String toString() => "$cartItems";

  @override
  List<Object> get props => [cartItems];
}
