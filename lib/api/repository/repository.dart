import '../provider/provider.dart';
import '../service/api_service.dart';
import '../service/app_url.dart';
import '../service/prefrences.dart';

class Repository extends Providers {
  // /-------------------------User related api-------------------------///
  Future<dynamic> requestSignUp({required Map<String, dynamic> map}) async =>
      await commonApiCall(
              endPoint: AppUrl.signup, method: Method.POST, map: map)
          .then((value) => value);

  Future<dynamic> requestLogin({required Map<String, dynamic> map}) async =>
      await commonApiCallwithContentTypeChanged(
          endPoint: AppUrl.userLogin +
              "?username=${map['username']}&password=${map['password']}",
          method: Method.POST,
          map: {}).then((value) => value);
}
