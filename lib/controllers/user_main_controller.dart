import 'package:get/get.dart';
import '../../view/screens/user_gauges _screen.dart';
import '../../view/screens/user_profile_screen.dart';

class UserMainController extends GetxController {
  RxInt currentIndex = 0.obs;
  final tabs = [
    UserGaugesScreen(),
    UserProfileScreen(),
  ].obs;

  final title = [
    "Gauges",
    "Profile",
  ].obs;
}
