import 'package:firebase_auth/firebase_auth.dart';

class LoginServices {
  Future<String> login(String email, String password) async {
    print("--" * 30);
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      print('Error: ${e.message}');
      return "";
      // Handle error, show error message, etc.
    }
  }
}
