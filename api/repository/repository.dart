import '../provider/provider.dart';
import '../service/api_service.dart';
import '../service/app_url.dart';
import '../service/prefrences.dart';

class Repository extends Providers {
  var deviceId = Pref.readData(key: Pref.DEVICE_ID);

  // /-------------------------User related api-------------------------///
  // Future<dynamic> requestLogin({required Map<String, dynamic> map}) async =>
  //     await commonApiCall(
  //             endPoint: AppUrl.loginApi, method: Method.POST, map: map)
  //         .then((value) => value);
}
