// Centrer le contenu verticalement, Ajouter un espacement et un padding

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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailTextEditingController,
                ),
                SizedBox(height: 30,),
                TextFormField(
                  controller: passwordTextEditingController,
                ),
                SizedBox(height: 30,),
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
      ),
    );
  }
}
