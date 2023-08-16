import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controllers/splash_controller.dart';
import '../widgets/text_utils.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                      child: Lottie.asset(
                    'assets/images/splashLogo.json',
                    fit: BoxFit.cover,
                  )),
                  const SizedBox(
                    height: 80,
                  ),
                  const TextUtils(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    text: 'City Waste',
                    color: Colors.white,
                    underline: TextDecoration.none,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextUtils(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    text: 'Management',
                    color: Colors.white,
                    underline: TextDecoration.none,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  const SpinKitHourGlass(
                    color: Colors.white,
                    size: 40.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
