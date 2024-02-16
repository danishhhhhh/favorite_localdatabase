
import 'package:firstapi/api/makeup_api.dart';
import 'package:firstapi/pages/product/products_controller.dart';
import 'package:firstapi/pages/favorite/favorites_view.dart';
import 'package:firstapi/pages/product/layouts/mobile_layout.dart';
import 'package:firstapi/pages/product/layouts/tablet_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Products extends StatelessWidget {
  final MakeupApi controllerApi = Get.put(MakeupApi());

  Products({super.key});

  @override
  Widget build(BuildContext context) {
    final LayoutController layoutController = Get.put(LayoutController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => layoutController.isMobileLayout.value
          ? MobileProduct(controllerApi: controllerApi)
          : TabletProduct(controllerApi: controllerApi),
      ),
        floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Favorite()),
              );
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
