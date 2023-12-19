import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.lable,
    required this.onPressed,
  });
  final String lable;
  final Function onPressed;

  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Background color
          foregroundColor: Colors.white, // Text color
          elevation: 4, // Elevation (shadow)
          padding: const EdgeInsets.symmetric(horizontal: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Border radius
          ),
        ),
        onPressed: () {
          onPressed();
        },
        child: Obx(() => loginController.isSigningIn.value
            ? const Padding(padding: EdgeInsets.symmetric(vertical: 5), child: CircularProgressIndicator(color: Colors.white,))
            : Text(lable)));
  }
}
