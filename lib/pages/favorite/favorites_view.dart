import 'package:firstapi/pages/favorite/favorite_controller.dart';
import 'package:firstapi/pages/favorite/layouts/mobile_layout.dart';
import 'package:firstapi/pages/product/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends GetView<FavoriteController> {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController layoutController = Get.put(ProductController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Favorite",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(() => layoutController.isMobileLayout.value
          ? MobileFavorite(favoriteController: controller)
          : MobileFavorite(favoriteController: controller)),
    );
  }
}
