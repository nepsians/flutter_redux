import 'package:redux/redux.dart';
import 'package:redux_app_example/actions/post_actions.dart';
import 'package:redux_app_example/models/post.dart';

final postReducer = combineReducers<PostsState>([
  TypedReducer<PostsState, SetPostLoading>(_loading),
  TypedReducer<PostsState, SetPostSuccess>(_setPostSuccess),
  TypedReducer<PostsState, SetPostError>(_setPostError),
]);

PostsState _loading(PostsState state, SetPostLoading action) {
  return state.copyWith(isLoading: true, isError: false);
}

PostsState _setPostSuccess(PostsState state, SetPostSuccess action) {
  return state.copyWith(isLoading: false, posts: action.posts);
}

PostsState _setPostError(PostsState state, SetPostError action) {
  return state.copyWith(isLoading: false, isError: action.error);
}
