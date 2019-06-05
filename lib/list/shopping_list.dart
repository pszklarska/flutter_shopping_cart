import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_shopping_cart/list/shopping_list_item.dart';
import 'package:flutter_shopping_cart/model/app_state.dart';
import 'package:flutter_shopping_cart/model/cart_item.dart';
import 'package:flutter_shopping_cart/redux/actions.dart';
import 'package:redux/redux.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ShoppingListViewModel>(
      converter: (store) => ShoppingListViewModel.build(store),
      builder: (context, viewModel) {
        return RefreshIndicator(
          onRefresh: viewModel.onRefresh,
          child: ListView.builder(
            itemCount: viewModel.cartItems.length,
            itemBuilder: (context, position) =>
                ShoppingListItem(viewModel.cartItems[position]),
          ),
        );
      },
    );
  }
}

class ShoppingListViewModel {
  final List<CartItem> cartItems;
  final RefreshCallback onRefresh;

  ShoppingListViewModel({this.cartItems, this.onRefresh});

  static ShoppingListViewModel build(Store<AppState> store) {
    return ShoppingListViewModel(
      cartItems: store.state.cartItems,
      onRefresh: () {
        var action = FetchCartItemsAction();
        store.dispatch(action);
        return action.completer.future;
      },
    );
  }
}
