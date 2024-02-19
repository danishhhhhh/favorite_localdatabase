import 'package:firstapi/api/makeup_api.dart';
import 'package:firstapi/pages/favorite/favorite_binding.dart';
import 'package:firstapi/pages/favorite/favorites_view.dart';
import 'package:firstapi/pages/product/product_binding.dart';
import 'package:firstapi/pages/product/products_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'db/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MakeupApi());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: "/products",
      getPages: [
        GetPage(
            name: "/products",
            page: () => const Products(),
            binding: ProductBinding()),
        GetPage(
            name: "/favorite",
            page: () => const Favorite(),
            binding: FavoriteBinding()),
      ],
    );
  }
}
