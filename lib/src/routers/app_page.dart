import 'package:get/get.dart';
import 'package:green_grocer/src/pages/auth/sign_in_screen.dart';
import 'package:green_grocer/src/pages/auth/sign_up_screen.dart';
import 'package:green_grocer/src/pages/base/base_screen.dart';
import 'package:green_grocer/src/pages/splash/splash_screen.dart';
import 'package:green_grocer/src/routers/pages_routers.dart';

abstract class AppPage {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRouters.splashRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: PagesRouters.signinRoute,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: PagesRouters.signupRoute,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: PagesRouters.baseRoute,
      page: () => const BaseScreen(),
    ),
  ];
}
