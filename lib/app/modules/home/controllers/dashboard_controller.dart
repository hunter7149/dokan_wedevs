import 'package:dokan/api/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class DashboardController extends GetxController {
  TextEditingController searchword = TextEditingController();
  RxList<dynamic> itemList = <dynamic>[].obs;
  RxList<dynamic> filteredItems = <dynamic>[].obs;

  RxBool isChecked = false.obs;

  RxBool isProductLoading = false.obs;
  requestProducts() async {
    try {
      isProductLoading(true);
      await Repository().getProductList(map: {}).then((value) {
        if (value != null && value['data'] != []) {
          itemList.clear();
          itemList.value = value['data'];
          itemList.refresh();
          isProductLoading(false);
        }
      });
    } on Exception catch (e) {
      isProductLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    isChecked(false);
    requestProducts();
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
