import 'package:flutter_shopping_cart/data/api_client.dart';
import 'package:flutter_shopping_cart/model/app_state.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreMock extends Mock implements Store<AppState> {}

class ApiClientMock extends Mock implements ApiClient {}

class SharedPreferencesMock extends Mock implements SharedPreferences {}
