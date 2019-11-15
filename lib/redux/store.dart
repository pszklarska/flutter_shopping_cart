import 'package:flutter_shopping_cart/data/api_client.dart';
import 'package:flutter_shopping_cart/model/app_state.dart';
import 'package:flutter_shopping_cart/redux/api_middleware.dart';
import 'package:flutter_shopping_cart/redux/prefs_middleware.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

import 'reducers.dart';

Store<AppState> createReduxStore() {
  final apiClient = ApiClient();

  return DevToolsStore<AppState>(
    appStateReducers,
    initialState: AppState.empty,
    middleware: [
      ApiMiddleware(apiClient),
      PrefsMiddleware(),
      LoggingMiddleware(),
    ],
  );
}

class LoggingMiddleware extends MiddlewareClass<AppState> {

  @override
  void call(Store<AppState> store, action, NextDispatcher next) {
    next(action);

    print('Action: $action');
    print('State: ${store.state.toJson()}');
  }
}
