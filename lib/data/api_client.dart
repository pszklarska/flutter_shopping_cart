import 'package:flutter_shopping_cart/model/cart_item.dart';

class ApiClient {
  Future<List<CartItem>> fetchCartItems() {
    return Future.delayed(Duration(seconds: 3), () {
      return [
        CartItem('Big red apple', false),
        CartItem('The quick brown fox', true),
        CartItem('The lazy dog', false),
      ];
    });
  }
}
