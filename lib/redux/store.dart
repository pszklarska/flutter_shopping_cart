import 'package:flutter_shopping_cart/data/api_client.dart';
import 'package:flutter_shopping_cart/model/app_state.dart';
import 'package:flutter_shopping_cart/redux/api_middleware.dart';
import 'package:flutter_shopping_cart/redux/logging_middleware.dart';
import 'package:flutter_shopping_cart/redux/prefs_middleware.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'reducers.dart';

Future<Store<AppState>> createReduxStore() async {
  final apiClient = ApiClient();
  final sharedPreferences = await SharedPreferences.getInstance();

  return DevToolsStore<AppState>(
    appStateReducers,
    initialState: AppState.empty(),
    middleware: [
      ApiMiddleware(apiClient),
      PrefsMiddleware(sharedPreferences),
      LoggingMiddleware(),
    ],
  );
}
