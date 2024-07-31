import '../provider/provider.dart';
import '../service/api_service.dart';
import '../service/app_url.dart';
import '../service/prefrences.dart';

class Repository extends Providers {
  // /-------------------------User related api-------------------------///
  Future<dynamic> requestSignOut({required Map<String, dynamic> map}) async =>
      await commonApiCall(
              endPoint: AppUrl.signout, method: Method.POST, map: map)
          .then((value) => value);

  Future<dynamic> requestLogin({required Map<String, dynamic> map}) async =>
      await commonApiCall(
              endPoint: AppUrl.userLogin, method: Method.POST, map: map)
          .then((value) => value);
  Future<dynamic> getProductList({required Map<String, dynamic> map}) async =>
      await tokenBaseApi(
              endPoint: AppUrl.productList, method: Method.GET, map: map)
          .then((value) => value);
}
