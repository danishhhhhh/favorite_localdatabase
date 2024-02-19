import 'dart:io';

import 'package:firstapi/db/db_helper.dart';
import 'package:firstapi/model/favorite_model.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteController extends GetxController {
  Database db = DbHelper.getDb();
  RxBool isLoading = false.obs;
  late List<Favorite> favorites;

  @override
  void onInit() {
    super.onInit();
    getFavorite();
  }

  void getFavorite() async {
    isLoading.value = true;
    List<Map<String, dynamic>> mapFavorites = await db.query("MakeUp");
    favorites = mapFavorites.map((e) => Favorite.fromMap(map: e)).toList();
    isLoading.value = false;
  }

  void removeFavorite(Favorite item) async {
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
