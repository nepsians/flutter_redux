import 'package:redux/redux.dart';
import 'package:redux_app_example/actions/actions.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, TodosLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}
