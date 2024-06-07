import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt indexNumber = 0.obs;
  PageController pagecontroller = PageController(initialPage: 0);
  updateIndex({required int value}) {
    if (value == 1 || value == 2) {
    } else {
      pagecontroller.jumpToPage(value);
      indexNumber(value);
    }

    // update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
