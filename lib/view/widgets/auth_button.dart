import 'package:city_waste_management/constants.dart';
import 'package:flutter/material.dart';
import 'text_utils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const AuthButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        minimumSize: const Size(360, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: TextUtils(
        color: Colors.white,
        text: text,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        underline: TextDecoration.none,
      ),
    );
  }
}
