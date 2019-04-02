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
