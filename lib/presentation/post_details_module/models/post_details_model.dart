import 'dart:convert';

Map<String, dynamic> postDetailsModelFromJson(String str) =>
    Map<String, dynamic>.from(json.decode(str).map((x) => PostDetailsModel.fromJson(x)));

class PostDetailsModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostDetailsModel({this.userId, this.id, this.title, this.body});

  PostDetailsModel.fromJson(Map<String, dynamic> json) {
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