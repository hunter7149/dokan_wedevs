import 'package:get_storage/get_storage.dart';

class Pref {
  static final box = GetStorage('dokan_app_data');

  static var token = 'login_token_dokan';
  static var USER_ID = 'user_id_dokan';

  static void writeData({required String key, required dynamic value}) =>
      box.write(key, value);

  static dynamic readData({required String key}) => box.read(key);

  static void removeData({required String key}) => box.remove(key);
}
