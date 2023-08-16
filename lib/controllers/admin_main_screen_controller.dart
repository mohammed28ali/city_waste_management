import 'package:city_waste_management/view/screens/add_new_user_screen.dart';
import 'package:get/get.dart';
import '../../view/screens/admin_map_screen.dart';
import '../../view/screens/admin_profile_screen.dart';

class AdminMainScreenController extends GetxController {
  RxInt currentIndex = 0.obs;
  final tabs = [AdminMap(), AddNewUserScreen(), AdminProfileScreen()].obs;
  final title = [
    "Location",
    "Users",
    "Admin Profile",
  ].obs;
}
