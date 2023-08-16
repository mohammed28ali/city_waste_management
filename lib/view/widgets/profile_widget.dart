import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/user_profile_controller.dart';
import 'text_utils.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({Key? key}) : super(key: key);

  final controller = Get.put(UserProfileController());
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://cdn.pixabay.com/photo/2012/04/26/19/43/profile-42914__340.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    text: controller
                        .capitalize(authController.displayUserName.value),
                    color: Colors.black,
                    underline: TextDecoration.none,
                  ),
                  TextUtils(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    text: authController.displayUserEmail.value,
                    color: Colors.black,
                    underline: TextDecoration.none,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
