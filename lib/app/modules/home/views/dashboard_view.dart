import 'dart:ffi';

import 'package:dokan/app/data/customWidgets/starCount.dart';
import 'package:dokan/app/modules/home/controllers/cartscreen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('DashboardView'),
        //   centerTitle: true,
        // ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        "Products",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff222455)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                      // padding:
                      //     EdgeInsets.symmetric(
                      //         horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors
                            .grey.shade200, // Set the background color to white
                        borderRadius: BorderRadius.all(
                            Radius.circular(5)), // Apply curved corners
                      ),
                      child: TextFormField(
                        // autofocus: true,
                        // focusNode: searchFocusNode,
                        onChanged: (value) {
                          // Handle the search logic here
                          if (value.isEmpty) {
                            controller.isChecked(false);
                            controller.filteredItems.clear();
                            controller.filteredItems
                                .addAll(controller.itemList);
                          } else {
                            controller.isChecked(true);
                            controller.filteredItems.value = controller.itemList
                                .where((product) => product['name']
                                    .toString()
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                          }
                        },
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          hintText: "Search", // Add placeholder text
                          border: InputBorder
                              .none, // Hide the default TextField border
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0), // Padding
                        ),
                        controller: controller.searchword,
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => controller.isProductLoading.value
                      ? Expanded(
                          child: Container(
                            child: Center(
                              child: SpinKitCircle(
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.54,
                              crossAxisCount: _getCrossAxisCount(context),
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemCount: controller.isChecked.value
                                ? controller.filteredItems.length
                                : controller.itemList.length,
                            itemBuilder: (context, index) {
                              return buildGridItem(
                                controller.isChecked.value
                                    ? controller.filteredItems[index]
                                    : controller.itemList[index],
                              );
                            },
                          ),
                        ),
                )
              ],
            )));
  }

  Widget buildGridItem(Map<String, dynamic> item) {
    TextEditingController quantity = TextEditingController(text: "1");
    increaseItem() {
      int temporaryQtry = int.parse(quantity.text);
      temporaryQtry++;
      quantity.text = temporaryQtry.toString();
    }

    ;
    decreaseItem() {
      int temporaryQtry = int.parse(quantity.text);
      if (temporaryQtry < 2) {
        temporaryQtry = 1;
      } else {
        temporaryQtry--;
        quantity.text = temporaryQtry.toString();
      }
    }

    ;

    addItem() {
      dynamic customItem = {
        "name": item['name'],
        "Stock": "${item['stockQty']}",
        "quantity": quantity.text,
      };
      Get.find<CartscreenController>().cartItems.add(customItem);
      Get.snackbar("Succes", "${item['name']} was added to cart",
          backgroundColor: Colors.green.withOpacity(0.4),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 1),
          animationDuration: Duration(seconds: 0));
    }

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff4D587721).withOpacity(0.13),
            offset: Offset(2, 3),
            blurRadius: 6,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image(
                  image: AssetImage("assets/images/noimage.jpg"),
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
                // Image.network(
                //   "https://www.clipartmax.com/png/middle/477-4772225_packing-unpacking-services-product-icon-blue-png.png",
                //   loadingBuilder: (context, child, loadingProgress) =>
                //       SpinKitFoldingCube(
                //     color: Colors.black,
                //   ),
                //   errorBuilder: (context, error, stackTrace) => Container(
                //     color: Colors.red.shade400,
                //     child: Image(
                //       image: AssetImage("assets/images/noimage.jpg"),
                //       width: double.maxFinite,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'] ?? "N/A",
                    style: TextStyle(
                      color: Colors.blueGrey.shade900,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "${item['price'] ?? "N/A"} BDT",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Stock: ${item['stockQty'].toString() ?? "N/A"}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Master Pack: ${item['pack_size'] ?? "N/A"}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ZoomTapAnimation(
                          onTap: () {
                            decreaseItem();
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            child: Center(
                                child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            )),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            height: 30,
                            decoration:
                                BoxDecoration(color: Colors.grey.shade300),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textAlignVertical: TextAlignVertical.top,
                              textAlign: TextAlign.center,
                              controller: quantity,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(bottom: 15)),
                            ),
                          ),
                        ),
                        ZoomTapAnimation(
                          onTap: () {
                            increaseItem();
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: Center(
                                child: Icon(
                              Icons.add,
                              color: Colors.white,
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_bag,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ZoomTapAnimation(
                          onTap: () {
                            addItem();
                          },
                          child: Text(
                            "Add to cart",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = 200; // Adjust this value based on your item's width
    final crossAxisCount = (screenWidth / itemWidth).floor();
    if (crossAxisCount == 1) {
      return 2;
    } else {
      return crossAxisCount;
    }
  }
}
