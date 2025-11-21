import 'package:flutter_assignment/core/network/api_service.dart';
import 'package:flutter_assignment/domin/usecases/get_post_usecases.dart';
import 'package:get/get.dart';
import '../../data/repositories/post_repository_impl.dart';
import 'package:get_storage/get_storage.dart';

class AppInjector {
  static Future<void> init() async {
    // Storage
    await GetStorage.init();
    Get.put<GetStorage>(GetStorage(), permanent: true);

    //  ApiService
    Get.put<ApiService>(ApiService.instance, permanent: true);

    // Repository
    Get.put<PostRepositoryImpl>(
      PostRepositoryImpl(apiService: Get.find<ApiService>()),
      permanent: true,
    );

    // Usecase
    Get.put<GetPostUsecases>(
      GetPostUsecases(Get.find<PostRepositoryImpl>()),
      permanent: true,
    );
  }
}
