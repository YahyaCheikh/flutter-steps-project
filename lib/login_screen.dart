import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CastumTextFormField(
                  textEditingController: emailTextEditingController,
                  hintText: "Email",
                  isObscure: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                CastumTextFormField(
                  textEditingController: passwordTextEditingController,
                  hintText: "Password",
                  isObscure: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                    lable: "Connexion",
                    onPressed: () {
                      loginController.login(
                          context,
                          emailTextEditingController.text,
                          passwordTextEditingController.text);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginController extends GetxController {
  final LoginServices _loginServices = LoginServices();
  var isSigningIn = false.obs;

  void setISSigningIn(var newValue) {
    isSigningIn.value = newValue;
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    setISSigningIn(true);
    await _loginServices.login(context, email, password);
    setISSigningIn(false);
  }
}

class LoginServices {
  Future<void> login(
      BuildContext context, String email, String password) async {
    print("--" * 30);
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Connexion réussie'),
            content: Text('User ID: ${userCredential.user!.uid}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print('Error: ${e.message}');
      // Handle error, show error message, etc.
    }
  }
}

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

class CastumTextFormField extends StatelessWidget {
  const CastumTextFormField({
    super.key,
    required this.textEditingController,
    required this.isObscure,
    required this.hintText,
  });

  final TextEditingController textEditingController;
  final bool isObscure;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey[500]!),
          borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        obscureText: isObscure,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[500],
              fontSize: 12,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none),
        controller: textEditingController,
      ),
    );
  }
}
