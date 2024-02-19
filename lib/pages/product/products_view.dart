import 'package:firstapi/api/makeup_api.dart';
import 'package:firstapi/pages/product/products_controller.dart';
import 'package:firstapi/pages/favorite/favorites_view.dart';
import 'package:firstapi/pages/product/layouts/mobile_layout.dart';
import 'package:firstapi/pages/product/layouts/tablet_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    final MakeupApi apiController = Get.put(MakeupApi());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => productController.isMobileLayout.value
          ? const MobileProduct()
          : TabletProduct(controllerApi: apiController),
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
