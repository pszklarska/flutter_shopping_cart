import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_cart/list/shopping_list.dart';
import 'package:flutter_shopping_cart/model/cart_item.dart';

class AddItemAction extends Equatable {
  final CartItem item;

  AddItemAction(this.item);

  @override
  List<Object> get props => [item];
}

class ToggleItemStateAction extends Equatable {
  final String item;

  ToggleItemStateAction(this.item);

  @override
  List<Object> get props => [item];
}

class FetchItemsAction extends Equatable {
  @override
  List<Object> get props => [];
}

class ItemLoadedAction extends Equatable {
  final List<CartItem> items;

  ItemLoadedAction(this.items);

  @override
  List<Object> get props => [items];
}

class RemoveItemAction extends Equatable {
  final CartItem item;

  RemoveItemAction(this.item);

  @override
  List<Object> get props => [item];
}

class FetchCartItemsAction extends Equatable {
  final OnStateChanged callback;

  FetchCartItemsAction(this.callback);

  @override
  List<Object> get props => [callback];
}
