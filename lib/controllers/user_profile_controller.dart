import 'package:get/get.dart';

class UserProfileController extends GetxController {
  String capitalize(String profileName) {
    return profileName.split(" ").map((name) => name.capitalize).join(" ");
  }
}
