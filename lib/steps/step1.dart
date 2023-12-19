

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              TextFormField(),
              TextFormField(),
              ElevatedButton(onPressed: (){}, child: Text("login"))
            ],
          ),
        ),
      ),
    );
  }
}