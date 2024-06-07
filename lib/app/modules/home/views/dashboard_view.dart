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
                        "Product List",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff222455)),
                      ),
                      Positioned(
                          right: 10,
                          // top: 20,
                          child: ZoomTapAnimation(
                            onTap: () {
                              controller.showBottomSheet(context);
                            },
                            child: Icon(
                              Icons.search,
                              color: Color(0xff222455),
                              size: 30,
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blue.shade100.withOpacity(0.3),
                            offset: Offset(0, 3),
                            blurRadius: 6),
                      ],
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ZoomTapAnimation(
                        onTap: () {
                          controller.showBottomSheet(context);
                        },
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.sliders,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Filter",
                              style: TextStyle(
                                  color: Color(0xff222455), fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Sort by",
                            style: TextStyle(
                                color: Color(0xff222455), fontSize: 16),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Color(0xff222455),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.menu,
                            color: Color(0xff222455),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
            flex: 3,
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  item['images'][0]['src'].replaceAll('\\', ''),
                  loadingBuilder: (context, child, loadingProgress) =>
                      SpinKitFoldingCube(
                    color: Colors.black,
                  ),
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.red.shade400,
                    child: Image(
                      image: AssetImage("assets/images/noimage.jpg"),
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
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
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      (item['sale_price'] == null || item['sale_price'] == "")
                          ? Text(
                              "\$${item['regular_price'] ?? "N/A"}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "\$${item['regular_price'] ?? "N/A"}",
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 16,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "\$${item['sale_price'] ?? "N/A"}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                    ],
                  ),
                  Row(
                    children: [
                      starRating(4)
                    ], // Assuming you have a function for star rating
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
