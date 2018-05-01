import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:flutter_shopping_cart/add_item/add_item_dialog.dart';
import 'package:flutter_shopping_cart/list/shopping_list.dart';
import 'package:flutter_shopping_cart/model/AppState.dart';
import 'package:flutter_shopping_cart/redux/actions.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:flutter_shopping_cart/redux/reducers.dart';
import 'package:flutter_shopping_cart/redux/middleware.dart';

class ShoppingCartApp extends StatelessWidget {
  final store = new DevToolsStore<AppState>(appStateReducers,
      initialState: AppState.empty, middleware: [storeCartItemsMiddleware]);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        title: 'ShoppingCart',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new StoreBuilder<AppState>(
            onInit: (store) => store.dispatch(new FetchItemsAction()),
            builder: (context, store) => new ShoppingCart(store)),
      ),
    );
  }
}

class ShoppingCart extends StatelessWidget {
  final DevToolsStore<AppState> store;

  ShoppingCart(this.store);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ShoppingCart'),
      ),
      body: new ShoppingList(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _openAddItemDialog(context),
        child: new Icon(Icons.add),
      ),
      endDrawer: new Container(
          width: 240.0,
          color: Colors.white,
          child: new ReduxDevTools(store)),
    );
  }
}

_openAddItemDialog(BuildContext context) {
  showDialog(
      context: context, builder: (context) => new AddItemDialog());
}
