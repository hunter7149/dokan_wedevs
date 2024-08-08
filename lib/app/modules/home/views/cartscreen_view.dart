import 'package:dokan/api/custom_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../controllers/cartscreen_controller.dart';

class CartscreenView extends GetView<CartscreenController> {
  const CartscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('CartscreenView'),
        //   centerTitle: true,
        // ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 70,
                  child: Obx(
                    () => controller.cartItems.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_bag_rounded,
                                size: 60,
                                color: Colors.orange.shade800,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Please add some item first!",
                                style: TextStyle(color: Colors.orange.shade800),
                              ),
                            ],
                          )
                        : ListView.builder(
                            itemCount: controller.cartItems.length,
                            itemBuilder: (context, index) {
                              TextEditingController quantity =
                                  TextEditingController(
                                      text:
                                          "${controller.cartItems[index]['quantity']}");
                              increaseItem() {
                                int temporaryQtry = int.parse(quantity.text);
                                temporaryQtry++;
                                quantity.text = temporaryQtry.toString();
                                controller.cartItems[index]['quantity'] =
                                    quantity.text;
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
                                controller.cartItems[index]['quantity'] =
                                    quantity.text;
                              }

                              ;
                              return Container(
                                // padding: EdgeInsets.symmetric(
                                //     horizontal: 16, vertical: 10),
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 0,
                                        right: 0,
                                        child: ZoomTapAnimation(
                                          onTap: () {
                                            controller.cartItems
                                                .removeAt(index);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10))),
                                            child: Center(
                                              child: Icon(
                                                Icons.close,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        )),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 100,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                bottomLeft: Radius.circular(15),
                                              ),
                                              child: Image(
                                                image: AssetImage(
                                                    "assets/images/noimage.jpg"),
                                                width: double.maxFinite,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Text(
                                                "Name: ${controller.cartItems[index]['name']}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),

                                              // Text(
                                              //     "Quantity: ${controller.cartItems[index]['quantity']}"),
                                              Container(
                                                width: double.maxFinite,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    ZoomTapAnimation(
                                                      onTap: () {
                                                        decreaseItem();
                                                      },
                                                      child: Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey.shade800,
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10))),
                                                        child: Center(
                                                            child: Icon(
                                                          Icons.remove,
                                                          color: Colors.white,
                                                        )),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 30,
                                                      width: 70,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade300),
                                                      child: TextFormField(
                                                        controller: quantity,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        textAlignVertical:
                                                            TextAlignVertical
                                                                .top,
                                                        textAlign:
                                                            TextAlign.center,
                                                        // controller: quantity,
                                                        decoration: InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        15)),
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
                                                            color: Colors
                                                                .grey.shade800,
                                                            borderRadius: BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        10))),
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
                                              SizedBox(height: 25)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                  ),
                ),
                Positioned(
                    bottom: 30,
                    left: 0,
                    right: 0,
                    child: Obx(() => controller.cartItems.isEmpty
                        ? Container()
                        : ZoomTapAnimation(
                            onTap: () {
                              controller.cartItems.clear();
                              CustomWidget.successMessage(
                                  title: "Congrats!",
                                  message: "Your order has been placed!!");
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.orange.shade700,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                "Checkout",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          )))
              ],
            )));
  }
}
