import 'package:flutter_shopping_cart/model/app_state.dart';
import 'package:flutter_shopping_cart/model/cart_item.dart';
import 'package:flutter_shopping_cart/redux/actions.dart';
import 'package:flutter_shopping_cart/redux/reducers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'WHEN app state is empty '
      'AND add item action is called '
      'THEN app state has one item list ', () {
    final oldState = AppState([]);
    final action = AddItemAction(CartItem('Test', false));
    final expectedState = AppState([CartItem('Test', false)]);

    final actualState = appStateReducers(oldState, action);

    expect(actualState, expectedState);
  });

  test(
      'WHEN app state item is checked '
      'AND add toggle item action is called '
      'THEN app state item is unchecked ', () {
    final oldState = AppState([CartItem('Test', false)]);
    final action = ToggleItemStateAction('Test');
    final expectedState = AppState([CartItem('Test', true)]);

    final actualState = appStateReducers(oldState, action);

    expect(actualState, expectedState);
  });

  test(
      'WHEN app state has one item '
      'AND remove item action is called '
      'THEN app state has zero items ', () {
    final oldState = AppState([CartItem('Test', false)]);
    final action = RemoveItemAction(CartItem('Test', false));
    final expectedState = AppState([]);

    final actualState = appStateReducers(oldState, action);

    expect(actualState, expectedState);
  });
}
