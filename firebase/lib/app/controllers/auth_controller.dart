import 'package:firebase/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Error",
          "User belum terdaftar. Silahkan daftar terlebih dahulu",
          duration: Duration(seconds: 5),
          animationDuration: Duration(milliseconds: 500),
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Error",
          "Password salah",
          duration: Duration(seconds: 5),
          animationDuration: Duration(milliseconds: 500),
        );
      }
    }
  }

  void signup(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed(Routes.SIGNUP);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provider is to weak.');
      } else if (e.code == 'email-alredy-in-use') {
        print('the account alredy exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
