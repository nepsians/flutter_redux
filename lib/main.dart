import 'dart:io';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_app_example/app.dart';
import 'package:redux_app_example/models/app_state.dart';
import 'package:redux_app_example/reducers/app_state.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:redux_thunk/redux_thunk.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final persistor = Persistor<AppState>(
    storage: FlutterStorage(), // Or use other engines
    serializer:
        JsonSerializer<AppState>(AppState.fromJson), // Or use other serializers
  );

  var initialState;
  try {
    initialState = await persistor.load();
  } catch (e) {
    initialState = null;
  }

  final store = Store<AppState>(
    appReducer,
    initialState: initialState ?? AppState.loading(),
    middleware: [
      persistor.createMiddleware(),
      thunkMiddleware,
      new LoggingMiddleware.printer()
    ],
  );

  runApp(ReduxApp(
    store: store,
  ));
}
