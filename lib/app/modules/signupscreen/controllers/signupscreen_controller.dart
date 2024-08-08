import 'package:dokan/api/custom_widgets.dart';
import 'package:dokan/api/repository/repository.dart';
import 'package:dokan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupscreenController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  RxBool isObsecure1 = true.obs;
  obsecureUpdater1() {
    isObsecure1.value = !isObsecure1.value;
    update();
  }

  RxBool isObsecure2 = true.obs;
  obsecureUpdater2() {
    isObsecure2.value = !isObsecure2.value;
    update();
  }

  //-------------Bool type variables---------------//
  RxBool isSignUpLoading = false.obs;

  validationCheck() {
    if (!email.text.isEmail) {
      CustomWidget.errorMessage(
          title: "Opps!", message: "Enter a valid email!");
    } else if (name.text.isEmpty || name.text.length < 2) {
      CustomWidget.errorMessage(title: "Opps!", message: "Enter a valid name!");
    } else if (password.text.isEmpty) {
      CustomWidget.errorMessage(title: "Opps!", message: "Enter password");
    } else if (password.text.isEmpty) {
      CustomWidget.errorMessage(
          title: "Opps!", message: "Enter confirm password");
    } else if (!password.text.contains(confirmPassword.text)) {
      CustomWidget.errorMessage(
          title: "Opps!", message: "Confirm password don't match");
    } else {
      // requestSignUp();
    }
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
