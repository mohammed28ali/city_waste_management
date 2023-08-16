import 'package:city_waste_management/routes/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    splashDuration();
  }

  void splashDuration() {
    Future.delayed(
        const Duration(
          milliseconds: 8000,
        ), () {
      Get.offNamed(Routes.loginScreen);
    });
  }
}
