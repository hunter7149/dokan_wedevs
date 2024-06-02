import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signupscreen_controller.dart';

class SignupscreenView extends GetView<SignupscreenController> {
  const SignupscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignupscreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SignupscreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
