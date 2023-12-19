// Ajouter la méthode de connexion à la méthode onPressed du bouton

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              TextFormField(
                controller: emailTextEditingController,
              ),
              TextFormField(
                controller: passwordTextEditingController,
              ),
              ElevatedButton(
                  onPressed: () async {
                    String email = emailTextEditingController.text;
                    String password = passwordTextEditingController.text;
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                              email: email, password: password);
                      print('-'*60);
                      print(userCredential.user!.uid);
                      print('-'*60);
                      //return userCredential;
                    } on FirebaseAuthException catch (e) {
                      print('Error: ${e.message}');
                      return null;
                    }
                  },
                  child: Text("login"))
            ],
          ),
        ),
      ),
    );
  }
}
