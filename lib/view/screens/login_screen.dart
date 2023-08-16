import 'package:city_waste_management/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:lottie/lottie.dart';
import '../../controllers/auth_controller.dart';
import '../../validation.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_text_form_field.dart';
import '../widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final fromKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                    color: primaryColor,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: TextUtils(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          text: ' LOG IN',
                          color: Colors.white,
                          underline: TextDecoration.none,
                        ),
                      ),
                      Container(
                          child: Lottie.asset(
                        'assets/images/loginAvater.json',
                        height: 300,
                        fit: BoxFit.fill,
                      )),
                    ],
                  ),
                ).asGlass(),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 40),
                    child: Form(
                      key: fromKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          AuthTextFormFiled(
                            controller: emailController,
                            obscureText: false,
                            validator: (value) {
                              if (!RegExp(validationEmail).hasMatch(value)) {
                                return 'Invalid email';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: primaryColor,
                            ),
                            suffixIcon: const Text(''),
                            hintText: 'Email',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GetBuilder<AuthController>(
                            builder: (_) {
                              return AuthTextFormFiled(
                                controller: passwordController,
                                obscureText:
                                    controller.isVisibility ? false : true,
                                validator: (value) {
                                  if (value.toString().length < 6) {
                                    return 'Password is wrong';
                                  } else {
                                    return null;
                                  }
                                },
                                prefixIcon: const Icon(
                                  Icons.lock_outlined,
                                  color: primaryColor,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.visibility();
                                  },
                                  icon: controller.isVisibility
                                      ? const Icon(
                                          Icons.visibility,
                                          color: primaryColor,
                                        )
                                      : const Icon(
                                          Icons.visibility_off,
                                          color: primaryColor,
                                        ),
                                ),
                                hintText: 'Password',
                              );
                            },
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          GetBuilder<AuthController>(builder: (_) {
                            return AuthButton(
                              onPressed: () {
                                if (fromKey.currentState!.validate()) {
                                  String email = emailController.text.trim();
                                  String password = passwordController.text;
                                  controller.loginUsingFirebase(
                                    email: email,
                                    password: password,
                                  );
                                }
                              },
                              text: 'Log In',
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
