import 'dart:io';

import 'package:flutter/foundation.dart';

import '../callbacks/callbacks.dart';
import '../service/api_service.dart';
import '../service/prefrences.dart';

abstract class Providers implements CallBack {
  @override
  Future<dynamic> commonApiCall(
      {required String endPoint,
      required Method method,
      required Map<String, dynamic> map}) async {
    Map<String, dynamic> finalMap = map;

    return await ApiService().request(endPoint, method, map);
  }

  @override
  Future<dynamic> commonApiCallwithContentTypeChanged(
      {required String endPoint,
      required Method method,
      required Map<String, dynamic> map}) async {
    Map<String, dynamic> finalMap = map;

    return await ApiService(contentTypechanged: true)
        .request(endPoint, method, map);
  }

  @override
  Future<dynamic> tokenBaseApi(
      {required String endPoint,
      required Method method,
      required Map<String, dynamic> map}) async {
    String token = Pref.readData(key: Pref.token);
    print(token);

    ///Adding some value in recieved map
    Map<String, dynamic> finalMap = map;

    print("Requested api token ------------>${token}");
    return await ApiService(token: token).request(endPoint, method, finalMap);
  }
}
