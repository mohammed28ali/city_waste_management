import 'package:city_waste_management/constants.dart';
import 'package:city_waste_management/view/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/all_users_info_controller.dart';
import '../../controllers/auth_controller.dart';
import '../../validation.dart';
import '../widgets/auth_text_form_field.dart';
import '../widgets/text_utils.dart';

class AddNewUserScreen extends StatelessWidget {
  AddNewUserScreen({Key? key}) : super(key: key);

  final fromKey = GlobalKey<FormState>();
  final authController = Get.put(AuthController());
  final allUsersInfo = Get.put(AllUsersInfoController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => ListView.builder(
          itemCount: allUsersInfo.usersInfo.length,
          itemBuilder: (context, index) => Card(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(15),
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: primaryColor,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                        title: TextUtils(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          text: allUsersInfo.usersInfo[index].name!,
                          color: primaryColor,
                          underline: TextDecoration.none,
                        ),
                        subtitle: TextUtils(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          text: allUsersInfo.usersInfo[index].email!,
                          color: primaryColor,
                          underline: TextDecoration.none,
                        ),
                        leading: CircleAvatar(
                          radius: 40,
                          backgroundColor: primaryColor,
                          child: TextUtils(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            text: allUsersInfo.usersInfo[index].name!
                                .substring(0, 1)
                                .capitalize!,
                            color: Colors.white,
                            underline: TextDecoration.none,
                          ),
                        ),
                        //trailing: (),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: AlignmentDirectional.bottomEnd,
        child: ElevatedButton(
          onPressed: () {
            Get.defaultDialog(
              title: "Add New User",
              content: Form(
                key: fromKey,
                child: Column(
                  children: [
                    AuthTextFormFiled(
                      controller: nameController,
                      obscureText: false,
                      suffixIcon: Text(''),
                      validator: (value) {
                        if (!RegExp(validationName).hasMatch(value)) {
                          return 'Invalid Name';
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: Colors.black,
                        size: 30,
                      ),
                      //suffixIcon: const Text(''),
                      hintText: 'Full Name',
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    AuthTextFormFiled(
                      controller: emailController,
                      obscureText: false,
                      suffixIcon: Text(''),
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
                        size: 30,
                      ),
                      //suffixIcon:Icon(Icons.email,size: 2,),
                      hintText: 'Email',
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    GetBuilder<AuthController>(
                      builder: (_) {
                        return AuthTextFormFiled(
                          controller: passwordController,
                          obscureText:
                              authController.isVisibility ? false : true,
                          validator: (value) {
                            if (value.toString().length < 6) {
                              return 'Password should be longer or equal to 6 characters';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: primaryColor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              authController.visibility();
                            },
                            icon: authController.isVisibility
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
                    const SizedBox(height: 9),
                    GetBuilder<AuthController>(builder: (_) {
                      return AuthButton(
                        onPressed: () {
                          authController.signUpUsingFirebase(
                            email: emailController.text.trim(),
                            name: nameController.text.trim(),
                            password: passwordController.text,
                          );
                          emailController.clear();
                          nameController.clear();
                          passwordController.clear();
                        },
                        text: 'Add New User',
                      );
                    }),
                  ],
                ),
              ),
              buttonColor: Colors.red,
              textCancel: "cancel",
              cancelTextColor: Colors.white,
              backgroundColor: Colors.black54.withOpacity(.5),
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            primary: primaryColor,
            minimumSize: const Size(100, 60),
            padding: const EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: const TextUtils(
            color: Colors.white,
            text: 'Add New User   +',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            underline: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
