import 'package:flutter_shopping_cart/data/api_client.dart';
import 'package:flutter_shopping_cart/model/app_state.dart';
import 'package:flutter_shopping_cart/redux/prefs_middleware.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

import 'api_middleware.dart';
import 'reducers.dart';

Store<AppState> createReduxStore() {
  final apiClient = ApiClient();

  return DevToolsStore<AppState>(
    appStateReducers,
    initialState: AppState.empty,
    middleware: [
      PrefsMiddleware(),
      ApiMiddleware(apiClient),
    ],
  );
}
