import 'package:get/get.dart';

import '../services/login_service.dart';

class LoginController extends GetxController {
  final LoginServices _loginServices = LoginServices();
  var isSigningIn = false.obs;

  void setISSigningIn(var newValue) {
    isSigningIn.value = newValue;
  }

  Future<String> login(String email, String password) async {
    setISSigningIn(true);
    String result = await _loginServices.login(email, password);
    setISSigningIn(false);
    return result;
  }
}
