import 'package:flutter_shopping_cart/data/api_client.dart';
import 'package:flutter_shopping_cart/model/app_state.dart';
import 'package:flutter_shopping_cart/redux/actions.dart';
import 'package:redux/redux.dart';

class ApiMiddleware extends MiddlewareClass<AppState> {
  final ApiClient apiClient;

  ApiMiddleware(this.apiClient);

  @override
  void call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is FetchCartItemsAction) {
      return _fetchCartItems(store, action);
    }

    next(action);
  }

  Future _fetchCartItems(Store<AppState> store, FetchCartItemsAction action) async {
    action.callback(true);
    var cartItems = await apiClient.fetchCartItems();
    store.dispatch(CartItemsFetchedAction(cartItems));
    action.callback(false);
  }
}
