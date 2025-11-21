import 'dart:developer';
import 'package:flutter_assignment/core/config/app_routes.dart';
import 'package:get/get.dart';
import 'package:app_links/app_links.dart';

final class DynamicLinkHandler {
  DynamicLinkHandler._();
  static final instance = DynamicLinkHandler._();

  final _appLinks = AppLinks();

  Future<void> initialize() async {
    // Live listener (foreground)
    _appLinks.uriLinkStream.listen(_handleLinkData).onError((error) {
      log('$error', name: 'Dynamic Link Handler');
    });

    // Cold start (app killed)
    _checkInitialLink();
  }

  Future<void> _checkInitialLink() async {
    final initialLink = await _appLinks.getInitialLink();
    if (initialLink != null) {
      _handleLinkData(initialLink);
    }
  }

  void _handleLinkData(Uri data) {
    log("Incoming Link: $data", name: "Dynamic Link Handler");

    final params = data.queryParameters;
    if (params.isEmpty) return;

    final productId = params["id"];
    final title = params["title"];

    //  Navigate to Animation page
    Get.toNamed(
      AppRoutes.animation,
      parameters: {
        "id": productId ?? "",
        "title": title ?? "",
      },
    );

    log("Navigating to Animation Page", name: "DeepLink");
  }

  /// Generate product share link
  Future<String> createProductLink({
    required int id,
    required String title,
  }) async {
    return 'https://example.com/products?id=$id&title=$title';
  }
}
