import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutController extends GetxController with WidgetsBindingObserver {
  RxBool isMobileLayout = true.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    checkScreenWidth();
  }

  void checkScreenWidth() {
    double screenWidth = Get.width;
    isMobileLayout.value = screenWidth < 640;
    print("Layout Berganti");
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
}
