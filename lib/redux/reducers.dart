import 'package:flutter_shopping_cart/model/CartItem.dart';
import 'package:flutter_shopping_cart/redux/actions.dart';

List<CartItem> cartItemsReducer(
    List<CartItem> items, dynamic action) {
  if (action is AddItemAction) {
    return addItem(items, action);
  } else if (action is ToggleItemStateAction) {
    return toggleItemState(items, action);
  }
  return items;
}

List<CartItem> addItem(List<CartItem> items, AddItemAction action) {
  return new List.from(items)..add(action.item);
}

List<CartItem> toggleItemState(
    List<CartItem> items, ToggleItemStateAction action) {
  List<CartItem> itemsNew = items
      .map((item) =>
          item.name == action.item.name ? action.item : item)
      .toList();
  return itemsNew;
}
