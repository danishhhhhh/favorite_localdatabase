import 'package:firstapi/pages/favorite/layouts/mobile_layout.dart';
import 'package:firstapi/pages/product/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    final LayoutController layoutController = Get.put(LayoutController());

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
          ? MobileFavorite()
          : MobileFavorite()),
    );
  }
}
