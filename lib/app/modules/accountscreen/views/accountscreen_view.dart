import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/accountscreen_controller.dart';

class AccountscreenView extends GetView<AccountscreenController> {
  const AccountscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AccountscreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AccountscreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
