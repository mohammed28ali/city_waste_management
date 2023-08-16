import 'package:city_waste_management/constants.dart';
import 'package:flutter/material.dart';
import '../widgets/logout_widgert.dart';
import '../widgets/profile_widget.dart';
import '../widgets/text_utils.dart';

class AdminProfileScreen extends StatelessWidget {
  AdminProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ProfileWidget(),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.grey,
            thickness: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          const TextUtils(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            text: 'General',
            color: primaryColor,
            underline: TextDecoration.none,
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          LogOutWidget(),
        ],
      ),
    );
  }
}
