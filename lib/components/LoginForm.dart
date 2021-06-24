import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_app_example/actions/post_actions.dart';
import 'package:redux_app_example/constants/styles.dart';
import 'package:redux_app_example/models/app_state.dart';
import 'package:redux_app_example/models/home.dart';
import 'package:redux_app_example/models/post.dart';

class LoginForm extends StatefulWidget {
  final LoginFormViewModal viewModal;
  LoginForm({Key key, this.viewModal}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    print(
        'homeeeeeeeeeee------------------${widget.viewModal.state.homeResponse}');
    return Form(
        child: Padding(
      padding: const EdgeInsets.only(left: 45, right: 45),
      child: Column(
        children: [
          Text(
            "Sign in",
            style: Styles.loginTitle,
          ),
          SizedBox(
            height: 20,
          ),
          widget.viewModal.state.isLoading
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () {
                    widget.viewModal.onLoginPressed();
                  },
                  child: Text('Login'),
                ),
          widget.viewModal.state.homeResponse != null
              ? Column(
                  children: [
                    Text(
                      'CashNut Id: ${widget.viewModal.state.homeResponse.id}',
                      style: Styles.loginTitle,
                    ),
                    Text(
                      'CashNut User: ${widget.viewModal.state.homeResponse.name}',
                      style: Styles.loginTitle,
                    ),
                    Text(
                      'Phone Number: ${widget.viewModal.state.homeResponse.phoneNumber}',
                      style: Styles.loginTitle,
                    ),
                    Text(
                      'Token: ${widget.viewModal.state.homeResponse.token}',
                      style: Styles.loginTitle,
                    ),
                  ],
                )
              : Container()
        ],
      ),
    ));
  }
}

class LoginFormViewModal {
  final Home state;
  final Function onLoginPressed;

  LoginFormViewModal({this.state, this.onLoginPressed});

  static LoginFormViewModal fromStore(Store<AppState> store) {
    return LoginFormViewModal(
      state: store.state.home,
      onLoginPressed: () => store.dispatch(loginAction),
    );
  }
}
