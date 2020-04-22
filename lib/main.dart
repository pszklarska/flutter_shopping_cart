import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:flutter_shopping_cart/actions.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

import 'add_item_dialog.dart';
import 'cart_item.dart';
import 'reducers.dart';

final Store<List<CartItem>> store = DevToolsStore<List<CartItem>>(
  appReducers,
  initialState: List<CartItem>(),
);

void main() => runApp(
      StoreProvider(
        store: store,
        child: MaterialApp(
          title: 'ShoppingCart',
          home: ShoppingCartApp(),
        ),
      ),
    );

class ShoppingCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>, ShoppingCartViewModel>(
      converter: (store) => ShoppingCartViewModel(
        items: store.state,
        onCartItemAdded: (cartItem) => store.dispatch(AddItemAction(cartItem)),
        onCartItemChanged: (cartItem) =>
            store.dispatch(ToggleItemStateAction(cartItem)),
      ),
      builder: (context, viewModel) {
        return Scaffold(
          endDrawer: Container(
            color: Colors.white,
            child: ReduxDevTools<List<CartItem>>(store),
          ),
          appBar: AppBar(
            title: Text('ShoppingCart'),
          ),
          body: ListView.builder(
            itemCount: viewModel.items.length,
            itemBuilder: (context, position) {
              final CartItem cartItem = viewModel.items[position];
              return ListTile(
                title: Text(cartItem.name),
                leading: Checkbox(
                  value: cartItem.checked,
                  onChanged: (newValue) =>
                      viewModel.onCartItemChanged(cartItem),
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final String newCartItemName = await showDialog<String>(
                context: context,
                builder: (context) => AddItemDialog(),
              );
              if (newCartItemName != null) {
                viewModel.onCartItemAdded(CartItem(newCartItemName, false));
              }
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class ShoppingCartViewModel {
  final List<CartItem> items;
  final Function(CartItem) onCartItemAdded;
  final Function(CartItem) onCartItemChanged;

  ShoppingCartViewModel({
    this.items,
    this.onCartItemAdded,
    this.onCartItemChanged,
  });
}
