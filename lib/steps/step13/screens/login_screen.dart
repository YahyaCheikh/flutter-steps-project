import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/custom_text_field.dart';

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
                    onPressed: () async {
                      String result = await loginController.login(
                          emailTextEditingController.text,
                          passwordTextEditingController.text);
                      if (result !="") {
                        Get.snackbar("Connexion établie", "User id : $result",
                            backgroundColor: Colors.grey[300],
                            boxShadows: [
                               BoxShadow(
                                offset: const Offset(4, 0),
                                blurRadius: 16,
                                color: Colors.grey[300]!
                              )
                            ]);
                      }
                      else{
                        Get.snackbar("Échec de la connexion", "Une erreur a été rencontrée",
                            backgroundColor: Colors.red[300],
                            boxShadows: [
                               BoxShadow(
                                offset: const Offset(4, 0),
                                blurRadius: 16,
                                color: Colors.grey[300]!
                              )
                            ]);

                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
