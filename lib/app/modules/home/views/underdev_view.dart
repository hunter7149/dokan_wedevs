import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/underdev_controller.dart';

class UnderdevView extends GetView<UnderdevController> {
  const UnderdevView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
          child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction,
              size: 80,
              color: Colors.red,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "This app is developed by Mohammad Khalid Bin Oalid for Limerick.Do not attempt coying the source code else you will face consequences beyond your imagination.",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ],
        ),
      )),
    );
  }
}
