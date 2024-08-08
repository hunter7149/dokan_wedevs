import 'package:dokan/api/service/prefrences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../controllers/accountscreen_controller.dart';

class AccountscreenView extends GetView<AccountscreenController> {
  const AccountscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(100)),
              child: Icon(
                CupertinoIcons.person,
                size: 100,
                color: Colors.blue.shade500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${Pref.readData(key: Pref.userName)}",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            ZoomTapAnimation(
              onTap: () {
                controller.requestLogout();
              },
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.red.shade600,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Sign out",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
