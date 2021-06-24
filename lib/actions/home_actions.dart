import 'package:redux_app_example/models/home.dart';

final String baseUrl = "http://almond-staging.gurzu.net/api/v1/users/sessions";

// account: {
//         phone_number: phoneNumber,
//         pin_code: get(values, "password", ""),
//         country_code: countryCode,
//         dialing_code: dialingCode,
//       },

abstract class HomeAction {}

class FetchHomeAction extends HomeAction {}

class FetchHomeSuccessAction extends HomeAction {
  final HomeResponse home;

  FetchHomeSuccessAction(this.home);
}

class FetchHomeErrorAction extends HomeAction {
  FetchHomeErrorAction();
}
