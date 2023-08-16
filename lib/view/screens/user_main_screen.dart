import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sweet_nav_bar/sweet_nav_bar.dart';
import '../../constants.dart';
import '../../controllers/user_main_controller.dart';
import '../widgets/text_utils.dart';

class UserMainScreen extends StatelessWidget {
  UserMainScreen({Key? key}) : super(key: key);
  final controller = Get.put(UserMainController());

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        child: Obx(() {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: TextUtils(
                text: controller.title[controller.currentIndex.value],
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                underline: TextDecoration.none,
              ),
              centerTitle: true,
              backgroundColor: primaryColor,
              elevation: 0.0,
              automaticallyImplyLeading: false,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
            ),
            bottomNavigationBar: SweetNavBar(
              currentIndex: controller.currentIndex.value,
              paddingBackgroundColor: Colors.white,
              backgroundColor: primaryColor,
              items: [
                SweetNavBarItem(
                  sweetActive: const Icon(
                    Icons.speed,
                    size: 30,
                  ),
                  sweetIcon: const Icon(
                    Icons.speed_outlined,
                    size: 25,
                  ),
                  sweetLabel: '',
                ),
                SweetNavBarItem(
                  sweetActive: const Icon(
                    Icons.person_pin_rounded,
                    size: 30,
                  ),
                  sweetIcon: const Icon(
                    Icons.person_pin_outlined,
                    size: 25,
                  ),
                  sweetLabel: '',
                ),
              ],
              onTap: (index) {
                controller.currentIndex.value = index;
              },
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs.value,
            ),
          );
        }),
      ),
    );
  }
}
