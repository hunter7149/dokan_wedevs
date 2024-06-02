import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginscreenController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool isObsecure = true.obs;
  obsecureUpdater() {
    isObsecure.value = !isObsecure.value;
    update();
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
