import 'package:flutter_shopping_cart/model/CartItem.dart';
import 'package:flutter_shopping_cart/redux/actions.dart';

List<CartItem> addItemReducer(List<CartItem> items, dynamic action) {
  if (action is AddItemAction) {
    return new List.from(items)..add(action.item);
  }
  return items;
}
