import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
            Icon(
              Icons.construction_outlined,
              size: 80,
              color: Colors.orange.shade500,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'This feature is under development',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
