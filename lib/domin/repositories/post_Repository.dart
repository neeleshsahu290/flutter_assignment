import 'package:flutter_assignment/domin/entities/post_entiy.dart';

abstract class PostRepository {
  Future<List<PostEntiy>> getPosts();
}
