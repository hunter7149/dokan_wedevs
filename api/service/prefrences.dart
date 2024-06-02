import 'package:get_storage/get_storage.dart';

class Pref {
  static final box = GetStorage('dokan_app_data');
  static var FCM_TOKEN = "fcm_token_osms";
  static var DEVICE_ID = 'device-id_osms';
  static var LOGIN_INFORMATION = 'login_information_osms';
  static var USER_ID = 'user_id_osms';

  static void writeData({required String key, required dynamic value}) =>
      box.write(key, value);

  static dynamic readData({required String key}) => box.read(key);

  static void removeData({required String key}) => box.remove(key);
}
