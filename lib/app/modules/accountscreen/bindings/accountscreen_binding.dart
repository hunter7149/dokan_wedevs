import 'package:get/get.dart';

import '../controllers/accountscreen_controller.dart';

class AccountscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountscreenController>(
      () => AccountscreenController(),
    );
  }
}
