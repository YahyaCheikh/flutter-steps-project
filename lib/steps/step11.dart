import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Show a dialog with the user ID
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Successful'),
            content: Text('User ID: ${userCredential.user!.uid}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('OK'),
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
                      login(context, email, password);
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
