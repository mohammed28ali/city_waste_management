import 'package:city_waste_management/constants.dart';
import 'package:city_waste_management/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sweet_nav_bar/sweet_nav_bar.dart';

import '../../controllers/admin_main_screen_controller.dart';

class AdminMainScreen extends StatelessWidget {
  AdminMainScreen({Key? key}) : super(key: key);

  final controller = Get.put(AdminMainScreenController());

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
                    Icons.location_on,
                    size: 30,
                  ),
                  sweetIcon: const Icon(
                    Icons.location_on_outlined,
                    size: 25,
                  ),
                  sweetLabel: '',
                ),
                SweetNavBarItem(
                  sweetActive: const Icon(
                    Icons.person_add_alt_1,
                    size: 30,
                  ),
                  sweetIcon: const Icon(
                    Icons.person_add_alt,
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
