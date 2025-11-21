import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/bindings/initial_binding.dart';
import 'package:flutter_assignment/core/config/app_routes.dart';
import 'package:flutter_assignment/core/di/app_injector.dart';
import 'package:flutter_assignment/core/linking/deep_linking.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInjector.init();
  await DynamicLinkHandler.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assignment',
      initialBinding: InitialBinding(),
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.pages,
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}
