import 'dart:async';
import 'dart:convert';

import 'package:flutter_shopping_cart/model/app_state.dart';
import 'package:flutter_shopping_cart/redux/actions.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String APP_STATE_KEY = "APP_STATE";

class PrefsMiddleware extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is AddItemAction ||
        action is ToggleItemStateAction ||
        action is RemoveItemAction) {
      await _saveStateToPrefs(store.state);
    }

    if (action is FetchItemsAction) {
      await _loadStateFromPrefs(store);
    }

    next(action);
  }

  Future _saveStateToPrefs(AppState state) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var stateString = json.encode(state.toJson());
    await preferences.setString(APP_STATE_KEY, stateString);
  }

  Future _loadStateFromPrefs(Store<AppState> store) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var stateString = preferences.getString(APP_STATE_KEY);
    if (stateString == null) return;
    var state = AppState.fromJson(json.decode(stateString));
    store.dispatch(ItemLoadedAction(state.cartItems));
  }
}
