import 'dart:io';

import 'package:firstapi/pages/favorite/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileFavorite extends StatelessWidget {
  const MobileFavorite({super.key, required this.favoriteController});

  final FavoriteController favoriteController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => favoriteController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : favoriteController.favorites.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_rounded,
                          size: 72,
                        ),
                        Text(
                          'No Favorite Item',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 45, bottom: 110),
                    itemCount: favoriteController.favorites.length,
                    itemBuilder: (context, index) {
                      final data = favoriteController.favorites[index];
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
                              Image.file(
                                File(data.image),
                                width: 100,
                                height: 100,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.title,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          child: IconButton(
                                            onPressed: () {
                                              favoriteController
                                                  .removeFavorite(data);
                                            },
                                            icon: const Icon(
                                              Icons.favorite_rounded,
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
      ),
    );
  }
}
