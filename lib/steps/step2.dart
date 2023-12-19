// Ajouter des contrôleurs pour récupérer le contenu des champs de saisie

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  final TextEditingController emailTextEditingController = TextEditingController();
  final TextEditingController passwordTextEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
                onPressed: () {
                  print("email : ${emailTextEditingController.text}");
                  print("-"*60);
                  print("password : ${passwordTextEditingController.text}");
                }, 
                child: Text("login")
                )
            ],
          ),
        ),
      ),
    );
  }
}