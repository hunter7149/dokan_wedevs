import 'dart:ffi';

import 'package:dokan/api/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../controllers/signupscreen_controller.dart';

class SignupscreenView extends GetView<SignupscreenController> {
  const SignupscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 33),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 50,
              ),
              Stack(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF395AB8).withOpacity(0.1),
                              offset: Offset(0, 3),
                              blurRadius: 4)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xffFF9472), Color(0xffF2709C)]),
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidget.CustomTextBox(
                      borderRadius: 10,
                      obsecure: false,
                      color: Colors.white,
                      hintText: "Name",
                      prefixIcon: FontAwesomeIcons.user,
                      textEditingController: controller.name,
                      keyboardType: TextInputType.text),
                  SizedBox(
                    height: 20,
                  ),
                  CustomWidget.CustomTextBox(
                      borderRadius: 10,
                      obsecure: false,
                      color: Colors.white,
                      hintText: "Email",
                      prefixIcon: Icons.email_outlined,
                      textEditingController: controller.email,
                      keyboardType: TextInputType.text),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF395AB8).withOpacity(0.1),
                              offset: Offset(0, 3),
                              blurRadius: 4)
                        ],
                        color:
                            Colors.white, // Set the background color to white
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)), // Apply curved corners
                      ),
                      child: TextField(
                        maxLength: null,
                        controller: controller.password,
                        obscureText: controller.isObsecure1.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey.shade500,
                          ),
                          suffixIcon: ZoomTapAnimation(
                              onTap: () {
                                controller.obsecureUpdater1();
                              },
                              child: !controller.isObsecure1.value
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey.shade500,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: Colors.grey.shade500,
                                    )),
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          hintText: "Password", // Add placeholder text
                          border: InputBorder
                              .none, // Hide the default TextField border
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 12.0), // Padding
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF395AB8).withOpacity(0.1),
                              offset: Offset(0, 3),
                              blurRadius: 4)
                        ],
                        color:
                            Colors.white, // Set the background color to white
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)), // Apply curved corners
                      ),
                      child: TextField(
                        maxLength: null,
                        controller: controller.confirmPassword,
                        obscureText: controller.isObsecure2.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey.shade500,
                          ),
                          suffixIcon: ZoomTapAnimation(
                              onTap: () {
                                controller.obsecureUpdater2();
                              },
                              child: !controller.isObsecure2.value
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey.shade500,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: Colors.grey.shade500,
                                    )),
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          hintText: "Confirm password", // Add placeholder text
                          border: InputBorder
                              .none, // Hide the default TextField border
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 12.0), // Padding
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => controller.isSignUpLoading.value
                          ? Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Color(0xffF75F55),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: SpinKitCircle(
                                color: Colors.white,
                              )),
                            )
                          : ZoomTapAnimation(
                              onTap: () {
                                controller.validationCheck();
                              },
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Color(0xffF75F55),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF395AB8).withOpacity(0.1),
                                    offset: Offset(0, 3),
                                    blurRadius: 4)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.facebookF,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF395AB8).withOpacity(0.1),
                                    offset: Offset(0, 3),
                                    blurRadius: 4)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Image.asset("assets/images/google.png")),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an  account?",
                          style: TextStyle(color: Color(0xffA4A9AF)),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        ZoomTapAnimation(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.blue.shade600),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
