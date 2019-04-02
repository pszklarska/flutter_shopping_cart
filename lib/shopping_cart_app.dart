import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:flutter_shopping_cart/add_item/add_item_dialog.dart';
import 'package:flutter_shopping_cart/list/shopping_list.dart';
import 'package:flutter_shopping_cart/model/app_state.dart';
import 'package:flutter_shopping_cart/redux/actions.dart';
import 'package:flutter_shopping_cart/redux/middleware.dart';
import 'package:flutter_shopping_cart/redux/reducers.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

class ShoppingCartApp extends StatelessWidget {
  final store = DevToolsStore<AppState>(appStateReducers,
      initialState: AppState.empty, middleware: [storeCartItemsMiddleware]);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'ShoppingList',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StoreBuilder<AppState>(
            onInit: (store) => store.dispatch(FetchItemsAction()),
            builder: (context, store) => ShoppingCart(store)),
      ),
    );
  }
}

class ShoppingCart extends StatelessWidget {
  final DevToolsStore<AppState> store;

  ShoppingCart(this.store);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShoppingList'),
      ),
      body: ShoppingList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddItemDialog(context),
        child: Icon(Icons.add),
      ),
      endDrawer: Container(
        width: 240.0,
        color: Colors.white,
        child: ReduxDevTools(store),
      ),
    );
  }
}

_openAddItemDialog(BuildContext context) {
  showDialog(context: context, builder: (context) => AddItemDialog());
}
