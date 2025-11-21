import 'package:flutter_assignment/domin/entities/post_entiy.dart';

class PostModel extends PostEntiy {
  const PostModel({
    required super.userId,
    required super.id,
    required super.body,
    required super.title,
    bool isFavorite = false,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'],
      id: json['id'],
      body: json['body'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'body': body, 'title': title};
  }
}
