import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_app_example/actions/actions.dart';
import 'package:redux_app_example/actions/post_actions.dart';
import 'package:redux_app_example/components/LoginForm.dart';
import 'package:redux_app_example/models/app_state.dart';
import 'package:redux_app_example/models/post.dart';
import 'package:redux_app_example/models/todo.dart';

class ReduxApp extends StatelessWidget {
  final Store<AppState> store;

  const ReduxApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Redux Example',
        home: HomeScreen(
          store: this.store,
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final Store<AppState> store;

  const HomeScreen({Key key, this.store}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePage();
}

class HomePage extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    // widget.store.dispatch(getPosts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: StoreConnector<AppState, LoginFormViewModal>(
        converter: (store) => LoginFormViewModal.fromStore(store),
        builder: (context, viewModal) {
          // if (posts.isLoading) {
          //   return Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }

          // if (posts.isError) {
          //   return Text("Error fetching posts.");
          // }

          return (Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Login to CashNut',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 20,
                ),
                LoginForm(
                  viewModal: viewModal,
                )
                // RaisedButton(
                //   onPressed: () {
                //     print(todos);
                //   },
                //   child: Text("Click to dispatch"),
                // ),
                // Flexible(
                //   child: ListView.builder(
                //       shrinkWrap: true,
                //       itemCount: posts.posts.length,
                //       itemBuilder: (BuildContext context, int index) {
                //         final post = posts.posts[index];

                //         return ListTile(
                //           onTap: () {
                //             print("clicked in tile");
                //           },
                //           title: Text(
                //             post.title,
                //             style: Theme.of(context).textTheme.bodyText2,
                //           ),
                //         );
                //       }),
                // )
              ],
            ),
          ));
        },
      ),
    );
  }
}

// StoreProvider.of<AppState>(context).dispatch(AddTodoAction(
//       Todo("Hello", id: "1", note: "First todo")));
