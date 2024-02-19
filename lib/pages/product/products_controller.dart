import 'dart:io';

import 'package:firstapi/db/db_helper.dart';
import 'package:firstapi/model/favorite_model.dart';
import 'package:firstapi/model/makeup_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ProductController extends GetxController with WidgetsBindingObserver {
  Database db = DbHelper.getDb();
  RxBool isMobileLayout = true.obs;
  RxBool isLoading = false.obs;
  List<Favorite> favorites = <Favorite>[].obs;

  @override
  void onInit() {
    super.onInit();
    getFavorite();
    WidgetsBinding.instance.addObserver(this);
    checkScreenWidth();
  }

  void checkScreenWidth() {
    double screenWidth = Get.width;
    isMobileLayout.value = screenWidth < 640;
  }

  @override
  void didChangeMetrics() {
    checkScreenWidth();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }



  void tapLike(BelajarApi item) {
    if(checkFavorite(item.id)){
      removeFavorite(item);
    } else {
      addFavorite(item);
    }
  }

  void addFavorite(BelajarApi item) async {
    isLoading.value = true;
    var response = await get(Uri.parse(item.imageLink));
    var documentDirectory = await getApplicationDocumentsDirectory();
    var firstPath = "${documentDirectory.path}/images";
    var filePathAndName = '${documentDirectory.path}/images/${item.id}.png';
    await Directory(firstPath).create(recursive: true);
    File file = File(filePathAndName);
    if (!await file.exists()) {
      file.writeAsBytesSync(response.bodyBytes);
      Favorite favorite = Favorite(
        id: item.id,
        title: item.name,
        image: filePathAndName,
      );
      await db.insert("MakeUp", favorite.toMap());
    }
    getFavorite();
  }

  bool checkFavorite(int id) {
    return favorites.any((item) => item.id == id);
  }

  void getFavorite() async {
    isLoading.value = true;
    List<Map<String, dynamic>> mapFavorites = await db.query("MakeUp");
    favorites = mapFavorites.map((e) => Favorite.fromMap(map: e)).toList();
    isLoading.value = false;
  }

  void removeFavorite(BelajarApi item) async {
    isLoading.value = true;
    await db.delete(
      "MakeUp",
      where: 'id = ?',
      whereArgs: [item.id],
    );
    var documentDirectory = await getApplicationDocumentsDirectory();
    var filePathAndName = '${documentDirectory.path}/images/${item.id}.png';
    File file = File(filePathAndName);

    if (await file.exists()) {
      await file.delete();
    }
    getFavorite();
  }
}
