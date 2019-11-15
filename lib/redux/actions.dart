import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_cart/list/shopping_list.dart';
import 'package:flutter_shopping_cart/model/cart_item.dart';

class AddItemAction {
  final CartItem item;

  AddItemAction(this.item);
}

class ToggleItemStateAction {
  final String item;

  ToggleItemStateAction(this.item);
}

class FetchItemsAction {}

class ItemLoadedAction extends Equatable {
  final List<CartItem> items;

  ItemLoadedAction(this.items);

  @override
  List<Object> get props => [items];
}

class RemoveItemAction {
  final CartItem item;

  RemoveItemAction(this.item);
}

class FetchCartItemsAction {
  final OnStateChanged callback;

  FetchCartItemsAction(this.callback);
}
