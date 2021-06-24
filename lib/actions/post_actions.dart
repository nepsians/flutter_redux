import 'dart:convert';

import 'package:japx/japx.dart';
import 'package:redux/redux.dart';
import 'package:redux_app_example/actions/home_actions.dart';
import 'package:redux_app_example/models/app_state.dart';
import 'package:redux_app_example/models/home.dart';
import 'package:redux_app_example/models/post.dart';
// import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;

class SetPostLoading {}

class SetPostSuccess {
  final List<IPost> posts;

  SetPostSuccess(this.posts);
}

class SetPostError {
  final bool error;

  SetPostError(this.error);
}

Future<void> getPosts(Store<AppState> store) async {
  // return (Store<AppState> store) async {
  store.dispatch(SetPostLoading());

  try {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/post');

    final jsonData = json.decode(response.body);

    store.dispatch(SetPostSuccess(IPost.listFromJson(jsonData)));
  } catch (error) {
    store.dispatch(SetPostError(true));
  }
  // };
}

Future<void> loginAction(Store<AppState> store) async {
  Map mapData = {
    'account': {
      'phone_number': '9897662914',
      'pin_code': '1234',
      'country_code': 'MM',
      'dialing_code': "+95",
    }
  };

  store.dispatch(FetchHomeAction());

  final postData = json.encode(mapData);

  try {
    final response = await http.post(baseUrl,
        headers: {"Content-Type": "application/json"}, body: postData);

    final decodeJson = Japx.decode(json.decode(response.body));

    store.dispatch(FetchHomeSuccessAction(HomeResponse.fromJsons(decodeJson)));

    print('Response ${decodeJson}');
  } catch (error) {
    store.dispatch(FetchHomeErrorAction());
    print('Error: ${error}');
  }
}
