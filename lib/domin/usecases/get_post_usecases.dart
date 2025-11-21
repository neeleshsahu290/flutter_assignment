import 'package:flutter_assignment/domin/entities/post_entiy.dart';
import 'package:flutter_assignment/domin/repositories/post_Repository.dart';

class GetPostUsecases {
  final PostRepository repository;
  GetPostUsecases(this.repository);
  Future<List<PostEntiy>> call() async {
    return await repository.getPosts();
  }
}
