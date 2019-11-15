import 'package:flutter_shopping_cart/data/api_client.dart';
import 'package:flutter_shopping_cart/model/app_state.dart';
import 'package:flutter_shopping_cart/model/cart_item.dart';
import 'package:flutter_shopping_cart/redux/actions.dart';
import 'package:flutter_shopping_cart/redux/api_middleware.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';

void main() {
  StoreMock store;
  ApiClientMock apiClient;
  ApiMiddleware apiMiddleware;

  setUp(() {
    store = StoreMock();
    apiClient = ApiClientMock();
    apiMiddleware = ApiMiddleware(apiClient);
  });

  test(
      'WHEN fetch cart items action is called '
      'AND api returns cart items  '
      'THEN cart items are loaded', () async {
    final expectedCartList = [
      CartItem('Test', false),
      CartItem('Test2', true),
    ];
    when(apiClient.fetchCartItems())
        .thenAnswer((_) => Future.value(expectedCartList));

    final action = FetchCartItemsAction((_) {});
    await apiMiddleware.call(store, action, (_) {});

    verify(store.dispatch(ItemLoadedAction(expectedCartList)));
  });
}

class StoreMock extends Mock implements Store<AppState> {}

class ApiClientMock extends Mock implements ApiClient {}
