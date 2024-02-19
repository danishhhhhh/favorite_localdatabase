import 'package:firstapi/api/makeup_api.dart';
import 'package:firstapi/pages/product/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileProduct extends StatelessWidget {
  const MobileProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    final MakeupApi apiController = Get.put(MakeupApi());
    return Obx(
      () => apiController.belajarApi.isEmpty ||
              productController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(top: 45, bottom: 110),
              itemCount: apiController.belajarApi.length,
              itemBuilder: (context, index) {
                final data = apiController.belajarApi[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFd5d5d5).withOpacity(1),
                        offset: const Offset(8, 8),
                        blurRadius: 50,
                        spreadRadius: -10,
                      ),
                    ],
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Image.network(
                          data.imageLink,
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.name,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: IconButton(
                                      onPressed: () {
                                        productController.tapLike(data);
                                      },
                                      icon: productController
                                              .checkFavorite(data.id)
                                          ? const Icon(
                                              Icons.favorite_rounded,
                                              size: 20,
                                              color: Colors.pinkAccent,
                                            )
                                          : const Icon(
                                              Icons.favorite_outline_rounded,
                                              size: 20,
                                              color: Colors.pinkAccent,
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
