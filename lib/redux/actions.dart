import 'package:flutter_shopping_cart/list/shopping_list.dart';
import 'package:flutter_shopping_cart/model/cart_item.dart';

class AddItemAction {
  final CartItem item;

  AddItemAction(this.item);
}

class ToggleItemStateAction {
  final CartItem item;

  ToggleItemStateAction(this.item);
}

class FetchItemsAction {}

class ItemLoadedAction {
  final List<CartItem> items;

  ItemLoadedAction(this.items);
}

class RemoveItemAction {
  final CartItem item;

  RemoveItemAction(this.item);
}

class FetchCartItemsAction {
  final OnStateChanged callback;

  FetchCartItemsAction(this.callback);
}

class CartItemsFetchedAction {
  final List<CartItem> cartItems;

  CartItemsFetchedAction(this.cartItems);
}
