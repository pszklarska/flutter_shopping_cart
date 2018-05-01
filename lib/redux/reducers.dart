import 'package:flutter_shopping_cart/model/AppState.dart';
import 'package:flutter_shopping_cart/model/CartItem.dart';
import 'package:flutter_shopping_cart/redux/actions.dart';

AppState appStateReducers(AppState state, dynamic action) {
  if (action is AddItemAction) {
    return addItem(state.cartItems, action);
  } else if (action is ToggleItemStateAction) {
    return toggleItemState(state.cartItems, action);
  } else if (action is RemoveItemAction) {
    return removeItem(state.cartItems, action);
  } else if (action is ItemLoadedAction) {
    return loadItems(action);
  }
  return state;
}

AppState addItem(List<CartItem> items, AddItemAction action) {
  return new AppState(List.from(items)..add(action.item));
}

AppState toggleItemState(List<CartItem> items, ToggleItemStateAction action) {
  return new AppState(
      items.map((item) => item.name == action.item.name ? action.item : item).toList());
}

AppState removeItem(List<CartItem> items, RemoveItemAction action) {
  return new AppState(
      List.from(items)..removeWhere((item) => item.name == action.item.name));
}

AppState loadItems(ItemLoadedAction action) {
  return new AppState(action.items);
}
