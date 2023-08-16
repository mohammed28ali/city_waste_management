import 'package:city_waste_management/view/screens/admin_main_screen.dart';
import 'package:city_waste_management/view/screens/login_screen.dart';
import 'package:city_waste_management/view/screens/user_main_screen.dart';
import 'package:get/get.dart';
import '../view/screens/splash_screen.dart';

class AppRoutes {
  //initial route
  static const splash=Routes.splashScreen;
  static const userMainScreen=Routes.userMainScreen;

  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () =>  SplashScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () =>  LoginScreen(),
    ),
    GetPage(
      name: Routes.userMainScreen,
      page: () =>  UserMainScreen(),
    ),
    GetPage(
      name: Routes.adminMainScreen,
      page: () =>  AdminMainScreen(),
    ),
  ];
}

class Routes {
  static const homeScreen = '/homeScreen';
  static const splashScreen = '/splashScreen';
  static const adminMainScreen = '/adminMainScreen';
  static const userMainScreen = '/userMainScreen';
  static const loginScreen = '/loginScreen';
}
