import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

// const BASE_URL = 'http://192.168.10.204:8090/dp/';
const BASE_URL =
//LOCAL//
    kDebugMode
        ? 'https://apptest.dokandemo.com/wp-json/'
        : 'https://apptest.dokandemo.com/wp-json/';

//LIVE//
// 'http://182.160.114.100:7171/dp/';
const Duration CONNECTION_TIMEOUT = Duration(seconds: 30);

class ApiService extends GetxService {
  late Dio _dio;

  //this is for header
  static header({String? token}) => {
        "Content-Type": 'application/json',
        "Accept": 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      };

  ApiService({String? token}) {
    print("Base URL ------------>${BASE_URL}");
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      headers: header(token: token),
      connectTimeout: CONNECTION_TIMEOUT,
      receiveTimeout: CONNECTION_TIMEOUT,
    ));
    initInterceptors();
  }

  void initInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      print('REQUEST[${options.method}] => PATH: ${options.path} '
          '=> Request Values: ${options.queryParameters}, => HEADERS: ${options.headers}');
      return handler.next(options);
    }, onResponse: (response, handler) {
      print('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
      return handler.next(response);
    }, onError: (err, handler) {
      print('ERROR[${err.response?.statusCode}]');
      return handler.next(err);
    }));
  }

  Future<Map<String, dynamic>> request(
      String url, Method method, Map<String, dynamic>? params) async {
    print("requested params -> ${params}");
    Response response;
    try {
      if (method == Method.POST) {
        response = await _dio.post(url, data: params);
      } else if (method == Method.DELETE) {
        response = await _dio.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio.patch(url);
      } else if (method == Method.PUT) {
        response = await _dio.put(url, data: params);
      } else {
        response = await _dio.get(
          url,
          queryParameters: params,
        );
      }
      print("response status code -> ${response.statusCode}");

      // Handle successful response (status code 200)
      if (response.statusCode == 200) {
        if (response.data is List) {
          // If the response data is a list, return the first item as a map
          return {"data": response.data};
        } else if (response.data is Map) {
          // If the response data is already a map, return it as is
          return response.data;
        } else if (response.data is String) {
          // If the response data is already a map, return it as is
          return {"stringError": response.data};
        } else {
          throw Exception("Unexpected response format");
        }
      }

      // Handle other status codes

      if (response.statusCode == 422) {
        return response.data;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something Went Wrong");
      }
    } on SocketException catch (e) {
      throw Exception("No Internet Connection -> $e");
    } on FormatException {
      throw Exception("Bad Response Format!");
    } on Exception catch (e) {
      print(e);
      throw Exception("Something went wrong!");
    }
  }
}
