import 'package:dokan/api/custom_widgets.dart';
import 'package:dokan/api/repository/repository.dart';
import 'package:dokan/api/service/prefrences.dart';
import 'package:dokan/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AccountscreenController extends GetxController {
  requestLogout() async {
    try {
      Repository().requestSignOut().then((value) {
        if (value != null) {
          if (value['success'].toString().toLowerCase().contains("true")) {
            Pref.readData(key: Pref.token);
            Get.offAllNamed(Routes.LOGINSCREEN);
          }
        } else {
          CustomWidget.errorMessage(
              title: "Error Occured", message: "Sign out failed");
        }
      });
    } on Exception catch (e) {
      CustomWidget.errorMessage(
          title: "Error Occured", message: "Sign out failed");
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
