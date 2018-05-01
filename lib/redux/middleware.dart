import 'dart:async';
import 'dart:convert';

import 'package:flutter_shopping_cart/model/AppState.dart';
import 'package:flutter_shopping_cart/redux/actions.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String APP_STATE_KEY = "APP_STATE";

void storeCartItemsMiddleware(Store<AppState> store, action, NextDispatcher next) {
  next(action);

  if (action is AddItemAction || action is ToggleItemStateAction) {
    saveStateToPrefs(store.state);
  }

  if (action is FetchItemsAction) {
    loadStateFromPrefs().then((state) {
      store.dispatch(new ItemLoadedAction(state.cartItems));
    });
  }
}

void saveStateToPrefs(AppState state) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var stateString = json.encode(state.toJson());
  await preferences.setString(APP_STATE_KEY, stateString);
}

Future<AppState> loadStateFromPrefs() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var stateString = preferences.getString(APP_STATE_KEY);
  Map stateMap = json.decode(stateString);
  return new AppState.fromJson(stateMap);
}
