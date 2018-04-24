import 'package:flutter_shopping_cart/actions.dart';

List<String> addItemReducer(List<String> items, dynamic action) {
  if (action is AddItemAction) {
    return new List.from(items)..add(action.itemName);
  }
  return items;
}
