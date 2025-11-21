import 'package:flutter_assignment/presentation/bindings/post_binding.dart';
import 'package:flutter_assignment/presentation/views/home_view.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String home = "/hone";
  static const String animation = "/animation";

  static final pages = [
    GetPage(name: home, page: () => HomeView(), binding: PostBinding()),
  ];
}
