import 'package:firstapi/pages/favorite/favorite_controller.dart';
import 'package:firstapi/pages/product/products_controller.dart';
import 'package:get/get.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoriteController());
  }
}