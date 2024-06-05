import 'package:dokan/api/custom_widgets.dart';
import 'package:dokan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../controllers/loginscreen_controller.dart';

class LoginscreenView extends GetView<LoginscreenController> {
  const LoginscreenView({Key? key}) : super(key: key);
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
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Image.asset('assets/images/dokan.png'),
                    ),
                    Text(
                      "Sign IN",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly, // Apply space evenly here
                  children: [
                    Column(
                      children: [
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
                              color: Colors
                                  .white, // Set the background color to white
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)), // Apply curved corners
                            ),
                            child: TextField(
                              maxLength: null,
                              controller: controller.password,
                              obscureText: controller.isObsecure.value,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.grey.shade500,
                                ),
                                suffixIcon: ZoomTapAnimation(
                                    onTap: () {
                                      controller.obsecureUpdater();
                                    },
                                    child: !controller.isObsecure.value
                                        ? Icon(
                                            Icons.visibility_off,
                                            color: Colors.grey.shade500,
                                          )
                                        : Icon(
                                            Icons.visibility,
                                            color: Colors.grey.shade500,
                                          )),
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade400),
                                hintText: "Password", // Add placeholder text
                                border: InputBorder
                                    .none, // Hide the default TextField border
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                    vertical: 12.0), // Padding
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot password?",
                              style: TextStyle(color: Color(0xffA4A9AF)),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => controller.isLogingIn.value
                          ? Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Color(0xffF75F55),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: SpinKitThreeBounce(
                                color: Colors.red,
                              )),
                            )
                          : ZoomTapAnimation(
                              onTap: () {
                                controller.requestLogin();
                              },
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Color(0xffF75F55),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "Login",
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
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.SIGNUPSCREEN);
                      },
                      child: Text(
                        "Create new account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
