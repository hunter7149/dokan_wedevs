import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dokan/app/modules/home/controllers/dashboard_controller.dart';
import 'package:dokan/app/modules/home/views/accountscreen_view.dart';
import 'package:dokan/app/modules/home/views/dashboard_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: PageView(
            controller: controller.pagecontroller,
            children: [DashboardView(), AccountscreenView()],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: ZoomTapAnimation(
          onTap: () {
            // Get.find<DashboardController>().showBottomSheet(context);
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: LinearGradient(
                    colors: [Colors.pink.shade400, Colors.orange.shade400])),
            child: Center(
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
        bottomNavigationBar: Obx(
          () => AnimatedBottomNavigationBar(
            shadow: BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0, -10),
                blurRadius: 14),
            leftCornerRadius: 32,
            rightCornerRadius: 32,
            gapLocation: GapLocation.center,
            activeIndex: controller.indexNumber.value,
            activeColor: Colors.pink.shade400,
            inactiveColor: Color(0xff6E7FAA),
            icons: [
              CupertinoIcons.home,
              Icons.dashboard,
              FontAwesomeIcons.cartShopping,
              FontAwesomeIcons.user
            ],
            onTap: (index) {
              controller.updateIndex(value: index);
            },
          ),
        ));
  }
}
