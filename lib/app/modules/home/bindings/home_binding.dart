import 'package:dokan/app/modules/home/controllers/accountscreen_controller.dart';
import 'package:dokan/app/modules/home/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<AccountscreenController>(
      () => AccountscreenController(),
    );
  }
}
