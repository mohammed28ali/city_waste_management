import 'package:city_waste_management/model/user_model.dart';
import 'package:city_waste_management/view/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';
import '../../services/network/firestore_user.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  var displayUserName = ''.obs;
  var displayUserEmail = ''.obs;
  static AuthController instance = Get.find();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  User? get userProfile => firebaseAuth.currentUser;

  @override
  void onInit() {
    displayUserName.value =
        (userProfile != null ? userProfile!.displayName : "")!;
    displayUserEmail.value = (userProfile != null ? userProfile!.email : "")!;
    super.onInit();
  }

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void loginUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {});
      update();
      if (email == 'admin@admin.com') {
        Get.offNamed(Routes.adminMainScreen);
      } else {
        Get.offNamed(Routes.userMainScreen);
      }
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message =
            'Account does not exists for that $email..Create your account by signing up.. ';
      } else if (error.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        await FireStoreUser().addUserToFireStore(UserModel(
          userId: user.user!.uid,
          email: email,
          name: name,
        ));
        displayUserName.value = name;
        firebaseAuth.currentUser!.updateDisplayName(name);
      });

      update();
      Get.snackbar(
        "Successfully Added",
        "New user is added",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      //Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'weak-password') {
        message = ' Provided Password is too weak.. ';
      } else if (error.code == 'email-already-in-use') {
        message = ' Account Already exists for that email.. ';
      } else {
        message = error.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void signOutFromApp() async {
    try {
      await firebaseAuth.signOut();
      displayUserName.value = '';
      displayUserEmail.value = '';
      update();
      Get.offAll(LoginScreen());
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}
