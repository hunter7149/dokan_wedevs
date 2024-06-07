import 'package:get/get.dart';

// import '../modules/accountscreen/bindings/accountscreen_binding.dart';
import '../modules/home/views/accountscreen_view.dart';
// import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/home/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/loginscreen/bindings/loginscreen_binding.dart';
import '../modules/loginscreen/views/loginscreen_view.dart';
import '../modules/signupscreen/bindings/signupscreen_binding.dart';
import '../modules/signupscreen/views/signupscreen_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGINSCREEN,
      page: () => const LoginscreenView(),
      binding: LoginscreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUPSCREEN,
      page: () => const SignupscreenView(),
      binding: SignupscreenBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      // binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.ACCOUNTSCREEN,
        page: () => const AccountscreenView(),
        transition: Transition.noTransition
        // binding: HomeBinding(),
        ),
  ];
}
