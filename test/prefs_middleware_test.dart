import 'package:flutter_shopping_cart/model/app_state.dart';
import 'package:flutter_shopping_cart/model/cart_item.dart';
import 'package:flutter_shopping_cart/redux/actions.dart';
import 'package:flutter_shopping_cart/redux/prefs_middleware.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mocks.dart';

void main() {
  StoreMock store;
  SharedPreferencesMock sharedPreferences;
  PrefsMiddleware middleware;

  setUp(() {
    store = StoreMock();
    sharedPreferences = SharedPreferencesMock();
    middleware = PrefsMiddleware(sharedPreferences);
  });

  test(
      'WHEN add cart item action is called '
      'THEN string is saved to preferences', () async {
    when(store.state).thenReturn(AppState.empty());

    final cartItem = CartItem('Test', false);
    final action = AddItemAction(cartItem);

    await middleware.call(store, action, (_) {});

    verify(sharedPreferences.setString(any, any));
  });

  test(
      'WHEN fetch cart items action is called '
      'THEN string are loaded from preferences', () async {
    when(sharedPreferences.getString(any)).thenReturn("{}");

    final action = FetchItemsAction();

    await middleware.call(store, action, (_) {});

    verify(sharedPreferences.getString(any));
    verify(store.dispatch(isInstanceOf<ItemLoadedAction>()));
  });
}
