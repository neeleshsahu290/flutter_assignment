import 'package:flutter_assignment/domin/entities/post_entiy.dart';
import 'package:flutter_assignment/domin/usecases/get_post_usecases.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PostController extends GetxController {
  final GetPostUsecases getPostsUseCase;
  final GetStorage storage;
  PostController({required this.getPostsUseCase, required this.storage});
  final posts = <PostEntiy>[].obs;
  final isLoading = false.obs;
  final error = ''.obs;

  final favorites = <int>[].obs;

  static const _favKey = 'favorites';

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
    fetchPosts();
  }

  void loadFavorites() {
    final stored = storage.read<List>(_favKey);
    if (stored != null) {
      favorites.assignAll(stored.cast<int>());
    }
  }

  void toggleFavorite(int id) {
    if (favorites.contains(id)) {
      favorites.remove(id);
    } else {
      favorites.add(id);
    }

    storage.write(_favKey, favorites.toList());

    posts.value = posts.map((post) {
      if (post.id == id) {
        return post.copyWith(isFavorite: favorites.contains(id));
      }
      return post;
    }).toList();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading(true);
      error('');

      final result = await getPostsUseCase();

      posts.assignAll(
        result.map((post) {
          return post.copyWith(isFavorite: favorites.contains(post.id));
        }).toList(),
      );
    } catch (e) {
      error(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> refreshPosts() async {
    try {
      if (posts.isEmpty) {
        isLoading(true);
      }
      error('');
      final result = await getPostsUseCase();
      posts.assignAll(
        result.map((post) {
          return post.copyWith(isFavorite: favorites.contains(post.id));
        }).toList(),
      );
    } catch (e) {
      if (posts.isEmpty) {
        error(e.toString());
      }
    } finally {
      if (posts.isEmpty) {
        isLoading(false);
      }
    }
  }
}
