import 'dart:async';

import 'package:dokan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Get.offNamed(Routes.LOGINSCREEN);
    });
    return Scaffold(
      body: Center(
          child: Container(
        child: Center(
          child: Image.asset("assets/images/dokan.png"),
        ),
      )),
    );
  }
}
