import 'dart:ffi';

import 'package:dokan/app/data/customWidgets/starCount.dart';
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
                              childAspectRatio: 0.57,
                              crossAxisCount: _getCrossAxisCount(context),
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
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
    TextEditingController quantity = TextEditingController();
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
            flex: 2,
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
                    "Stock: ${item['stockQty'] ?? "N/A"} BDT",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Master Pack,: ${item['pack_size'] ?? "N/A"} BDT",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade900,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          child: Icon(Icons.remove),
                        ),
                        Container(
                            height: 30,
                            margin: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            // padding:
                            //     EdgeInsets.symmetric(
                            //         horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.grey
                                  .shade200, // Set the background color to white
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5)), // Apply curved corners
                            ),
                            child: TextFormField(
                              // autofocus: true,
                              // focusNode: searchFocusNode,
                              decoration: InputDecoration(
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade400),
                                hintText: "Search", // Add placeholder text
                                border: InputBorder
                                    .none, // Hide the default TextField border
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                    vertical: 10.0), // Padding
                              ),
                              controller: controller.searchword,
                            )),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade900,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Icon(Icons.add),
                        )
                      ], // Assuming you have a function for star rating
                    ),
                  )
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
