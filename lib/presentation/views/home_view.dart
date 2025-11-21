import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';
import '../widgets/post_card.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final controller = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.error.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Error: \${controller.error.value}'),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: controller.fetchPosts,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.refreshPosts,
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: controller.posts.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final post = controller.posts[index];
              return PostCard(
                post: post,
                onFavoriteToggle: () => controller.toggleFavorite(post.id),
                isFavorite: controller.favorites.contains(post.id),
              );
            },
          ),
        );
      }),
    );
  }
}
