import 'package:get/get.dart';

import '../../home/controllers/underdev_controller.dart';

class UnderdevBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UnderdevController>(
      () => UnderdevController(),
    );
  }
}
