import 'package:flutter_assignment/domin/usecases/get_post_usecases.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../controllers/post_controller.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostController(
          getPostsUseCase: Get.find<GetPostUsecases>(),
          storage: Get.find<GetStorage>(),
        ));
        
  }
}
