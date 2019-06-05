import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_shopping_cart/list/shopping_list_item.dart';
import 'package:flutter_shopping_cart/model/app_state.dart';
import 'package:flutter_shopping_cart/model/cart_item.dart';
import 'package:flutter_shopping_cart/redux/actions.dart';
import 'package:redux/redux.dart';

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ShoppingListViewModel>(
      converter: (store) => ShoppingListViewModel.build(store),
      builder: (context, viewModel) {
        return Column(
          children: <Widget>[
            FlatButton(
              onPressed: () => viewModel.onRefresh(_onViewStateChanged),
              child: Text('Refresh'),
            ),
            Expanded(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: viewModel.cartItems.length,
                      itemBuilder: (context, position) =>
                          ShoppingListItem(viewModel.cartItems[position]),
                    ),
            ),
          ],
        );
      },
    );
  }

  void _onViewStateChanged(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }
}

class ShoppingListViewModel {
  final List<CartItem> cartItems;
  final Function(OnStateChanged) onRefresh;

  ShoppingListViewModel({this.cartItems, this.onRefresh});

  static ShoppingListViewModel build(Store<AppState> store) {
    return ShoppingListViewModel(
      cartItems: store.state.cartItems,
      onRefresh: (callback) {
        store.dispatch(FetchCartItemsAction(callback));
      },
    );
  }
}

typedef OnStateChanged = Function(bool isLoading);
