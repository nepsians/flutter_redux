import 'package:meta/meta.dart';

class HomeResponse {
  String name;
  String phoneNumber;
  String id;
  String token;

  HomeResponse(this.name, this.phoneNumber, this.id, this.token);

  HomeResponse.fromJsons(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['data']['full_name'];
    phoneNumber = json['data']['phone_number'];
    id = json['data']['id'];
    token = json['data']['authentication_token'];
  }

  dynamic toJson() => {
        'name': name ?? '',
        'phoneNumber': phoneNumber ?? '',
        'id': id ?? '',
        "token": token ?? ''
      };

  static HomeResponse fromJson(dynamic json) {
    return HomeResponse(
        json['name'], json['phoneNumber'], json['id'], json['token']);
  }
}

@immutable
class HomeError {
  final String errorStatus;
  final String errorMsg;

  HomeError({this.errorStatus = "", this.errorMsg = ""});
}

@immutable
class Home {
  final bool isLoading;
  final HomeResponse homeResponse;
  final HomeError homeError;

  Home({this.homeResponse, this.isLoading = false, this.homeError});

  factory Home.initial() =>
      Home(isLoading: false, homeError: null, homeResponse: null);

  dynamic toJson() => {
        'homeResponse':
            this.homeResponse != null ? this.homeResponse.toJson() : ''
      };

  static Home fromJson(dynamic json) {
    return Home(homeResponse: HomeResponse.fromJson(json['homeResponse']));
  }

  Home copyWith(
      {bool isLoading, HomeResponse homeResponse, HomeError homeError}) {
    return Home(
      homeResponse: homeResponse ?? this.homeResponse,
      isLoading: isLoading ?? this.isLoading,
      homeError: homeError ?? this.homeError,
    );
  }
}
