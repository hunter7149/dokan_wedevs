import 'package:dokan/api/custom_widgets.dart';
import 'package:dokan/api/repository/repository.dart';
import 'package:dokan/api/service/prefrences.dart';
import 'package:dokan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginscreenController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool isObsecure = true.obs;
  RxBool isLogingIn = false.obs;
  obsecureUpdater() {
    isObsecure.value = !isObsecure.value;
    update();
  }

  requestLogin() async {
    if (email.text.isEmpty) {
      CustomWidget.errorMessage(
          title: "Opps!", message: "Email can't be empty");
    } else if (password.text.isEmpty) {
      CustomWidget.errorMessage(
          title: "Opps!", message: "Password can't be empty");
    } else {
      try {
        isLogingIn(true);
        await Repository().requestLogin(map: {
          "email": "${email.text}",
          "password": "${password.text}"
        }).then((value) async {
          if (value != null || value != {}) {
            if (value['token'].toString().isNotEmpty) {
              Pref.writeData(
                key: Pref.token,
                value: value['token'].toString(),
              );
              Pref.writeData(key: Pref.USER_ID, value: value['data']['id']);
              Pref.writeData(key: Pref.userName, value: value['data']['name']);

              Get.offNamed(Routes.HOME);
              // print("${Pref.readData(key: Pref.token)}");
              isLogingIn(false);
            }
          } else {
            isLogingIn(false);
          }
        });
      } on Exception catch (e) {
        CustomWidget.errorMessage(title: "Opps", message: "User login failed");
        isLogingIn(false);
      }
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
