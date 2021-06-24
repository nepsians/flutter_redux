import 'package:flutter/cupertino.dart';
import 'package:redux_app_example/models/home.dart';
import 'package:redux_app_example/models/post.dart';
import 'package:redux_app_example/models/todo.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<Todo> todos;
  final Home home;
  final PostsState posts;

  AppState(
      {this.isLoading = false, this.todos = const [], this.home, this.posts});

  factory AppState.loading() {
    return AppState(
        isLoading: false, posts: PostsState.initial(), home: Home.initial());
  }

  static AppState fromJson(dynamic json) {
    return AppState(home: Home.fromJson(json['home']));
  }

  dynamic toJson() => {'home': this.home.toJson()};

  AppState copyWith({
    bool isLoading,
    List<Todo> todos,
    Home home,
    PostsState posts,
  }) {
    return AppState(
        isLoading: isLoading ?? this.isLoading,
        todos: todos ?? this.todos,
        home: home ?? this.home,
        posts: posts ?? this.posts);
  }
}
