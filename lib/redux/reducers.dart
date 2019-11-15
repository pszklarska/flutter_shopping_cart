import 'package:flutter_shopping_cart/model/app_state.dart';
import 'package:flutter_shopping_cart/model/cart_item.dart';
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
  return AppState(List.from(items)..add(action.item));
}

AppState toggleItemState(List<CartItem> items, ToggleItemStateAction action) {
  return AppState(items
      .map((item) =>
          item.name == action.item ? CartItem(action.item, !item.checked) : item)
      .toList());
}

AppState removeItem(List<CartItem> items, RemoveItemAction action) {
  return AppState(List.from(items)..removeWhere((item) => item.name == action.item.name));
}

AppState loadItems(ItemLoadedAction action) {
  return AppState(action.items);
}