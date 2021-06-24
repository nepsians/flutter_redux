import 'package:redux/redux.dart';
import 'package:redux_app_example/actions/home_actions.dart';
import 'package:redux_app_example/models/home.dart';

final homeReducer = combineReducers<Home>([
  TypedReducer<Home, FetchHomeAction>(_fetchHome),
  TypedReducer<Home, FetchHomeSuccessAction>(_fetchSuccess),
  TypedReducer<Home, FetchHomeErrorAction>(_fetchError),
]);

Home _fetchHome(Home home, FetchHomeAction action) {
  print("called fetch home");
  return home.copyWith(isLoading: true, homeResponse: null, homeError: null);
}

Home _fetchSuccess(Home home, FetchHomeSuccessAction action) {
  return home.copyWith(isLoading: false, homeResponse: action.home);
}

Home _fetchError(Home home, FetchHomeErrorAction action) {
  return home.copyWith(isLoading: false);
}
