import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomWidget {
  static CustomTextBox(
      {required bool obsecure,
      required String hintText,
      required TextEditingController textEditingController,
      required TextInputType keyboardType,
      double? borderRadius,
      bool? enabled,
      int? maxlength,
      IconData? prefixIcon,
      IconData? suffixIcon,
      double? hMargin,
      Color? color}) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 30),
      // padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color(0xFF395AB8).withOpacity(0.1),
              offset: Offset(0, 3),
              blurRadius: 4)
        ],
        color: color ?? Colors.white, // Set the background color to white
        borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 30.0)), // Apply curved corners
      ),
      child: TextField(
        maxLength: maxlength ?? null,
        keyboardType: keyboardType,
        controller: textEditingController,
        obscureText: obsecure,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon ?? Icons.email,
            color: Colors.grey.shade500,
          ),
          suffixIcon: Icon(prefixIcon ?? Icons.abc, color: Colors.white),
          hintStyle: TextStyle(color: Colors.grey.shade400),
          hintText: hintText, // Add placeholder text
          border: InputBorder.none, // Hide the default TextField border
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0), // Padding
        ),
      ),
    );
  }

  static errorMessage({required String title, required String message}) {
    return Get.snackbar(title, message,
        colorText: Colors.white,
        animationDuration: Duration(seconds: 0),
        borderRadius: 0,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.shade500,
        duration: Duration(seconds: 2));
  }

  static successMessage({required String title, required String message}) {
    return Get.snackbar(title, message,
        colorText: Colors.white,
        animationDuration: Duration(seconds: 0),
        borderRadius: 0,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.shade500,
        duration: Duration(seconds: 2));
  }

  static heightBox({required double height}) {
    return SizedBox(
      height: height,
    );
  }

  static widthBox({required double width}) {
    return SizedBox(
      width: width,
    );
  }
}
