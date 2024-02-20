import 'package:firstapi/api/makeup_api.dart';
import 'package:firstapi/pages/favorite/favorite_controller.dart';
import 'package:firstapi/pages/product/products_controller.dart';
import 'package:firstapi/pages/favorite/favorites_view.dart';
import 'package:firstapi/pages/product/layouts/mobile_layout.dart';
import 'package:firstapi/pages/product/layouts/tablet_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Products extends GetView<ProductController> {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => controller.isMobileLayout.value
          ? const MobileProduct()
          : const TabletProduct(),
      ),
        floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: InkWell(
            onTap: () {
              Get.toNamed("/favorite");
            },
            child: Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(64),
              ),
              child: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        )
    );
  }
}
