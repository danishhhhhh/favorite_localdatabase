import 'package:firstapi/api/makeup_api.dart';
import 'package:firstapi/model/favorite_model.dart';
import 'package:firstapi/pages/favorite/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileProduct extends StatelessWidget {
  const MobileProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController = Get.put(FavoriteController());
    final MakeupApi apiController = Get.put(MakeupApi());
    return Obx(() {
      if (apiController.isOffline.value) {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.signal_wifi_connected_no_internet_4_rounded,
                size: 72,
              ),
              SizedBox(height: 20),
              Text(
                'Uh Oh No internet',
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.w900),
              ),
            ],
          ),
        );
      }
      return apiController.belajarApi.isEmpty
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
            margin: const EdgeInsets.symmetric(
                horizontal: 30, vertical: 5),
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 5),
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
                              child: Obx(
                                    () =>
                                    IconButton(
                                      onPressed: () {
                                        favoriteController.tapLike(
                                          Favorite(
                                              id: data.id,
                                              title: data.name,
                                              image: data.imageLink),
                                        );
                                      },
                                      icon: Icon(
                                        favoriteController
                                            .checkFavorite(data.id)
                                            .value
                                            ? Icons.favorite_rounded
                                            : Icons
                                            .favorite_outline_rounded,
                                        size: 20,
                                        color: Colors.pinkAccent,
                                      ),
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
      );
    });
  }
}
