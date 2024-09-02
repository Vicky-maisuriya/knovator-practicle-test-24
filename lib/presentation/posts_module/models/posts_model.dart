import 'dart:convert';

List<PostsModel> postsModelFromJson(String str) =>
    List<PostsModel>.from(json.decode(str).map((x) => PostsModel.fromJson(x)));

String postsModeltoJson(List<PostsModel> str) =>
    json.encode(List<dynamic>.from(str.map((x) => x.toJson())));

class PostsModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostsModel({this.userId, this.id, this.title, this.body});

  PostsModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;

    return data;
  }
}