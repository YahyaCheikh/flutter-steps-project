import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  Future<void> login(String email, String password) async {
    String email = emailTextEditingController.text;
    String password = passwordTextEditingController.text;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print('-' * 60);
      print(userCredential.user!.uid);
      print('-' * 60);
      //return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Error: ${e.message}');
      return null;
    }
  }

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
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Background color
                      foregroundColor: Colors.white, // Text color
                      elevation: 4, // Elevation (shadow)
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Border radius
                      ),
                    ),
                    onPressed: () async {
                      String email = emailTextEditingController.text;
                      String password = passwordTextEditingController.text;
                      login(email, password);
                    },
                    child: const Text("login"))
              ],
            ),
          ),
        ),
      ),
    );
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
