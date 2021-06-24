import 'package:flutter/cupertino.dart';

class IPost {
  int id;
  int userId;
  String title;
  String body;

  IPost.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    body = json['body'];
  }

  static List<IPost> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => IPost.fromJson(value)).toList();
  }
}

@immutable
class PostsState {
  final bool isError;
  final bool isLoading;
  final List<IPost> posts;

  PostsState({
    this.isError,
    this.isLoading,
    this.posts,
  });

  factory PostsState.initial() => PostsState(
        isLoading: false,
        isError: false,
        posts: const [],
      );

  PostsState copyWith({
    bool isError,
    bool isLoading,
    List<IPost> posts,
  }) {
    return PostsState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      posts: posts ?? this.posts,
    );
  }
}
