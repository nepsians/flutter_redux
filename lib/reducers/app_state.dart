import 'package:redux_app_example/models/app_state.dart';
import 'package:redux_app_example/reducers/home_reducer.dart';
import 'package:redux_app_example/reducers/loading_reducer.dart';
import 'package:redux_app_example/reducers/post_reducer.dart';
import 'package:redux_app_example/reducers/todos_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    todos: todosReducer(state.todos, action),
    home: homeReducer(state.home, action),
    posts: postReducer(state.posts, action),
  );
}
