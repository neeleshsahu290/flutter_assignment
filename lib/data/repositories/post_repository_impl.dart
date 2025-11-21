import 'package:flutter_assignment/core/network/api_service.dart';
import 'package:flutter_assignment/data/models/post_model.dart';
import 'package:flutter_assignment/domin/entities/post_entiy.dart';
import 'package:flutter_assignment/domin/repositories/post_Repository.dart';

class PostRepositoryImpl extends PostRepository {
  ApiService apiService;
  PostRepositoryImpl({required this.apiService});

@override
Future<List<PostEntiy>> getPosts() async {
  final raw = await apiService.get('/posts');  

  return (raw as List)
      .map((json) => PostModel.fromJson(json)) 
      .toList();
}
}
