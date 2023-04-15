import 'package:firebase/app/controllers/auth_controller.dart';
import 'package:firebase/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final authC = Get.find<AuthController>();
  final emailC = TextEditingController();
  final passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignupView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              controller: emailC,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passC,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
                // Validasi email dengan regex
                RegExp regex = new RegExp(r'^[a-zA-Z0-9.]+@gmail\.com$');
                if (!regex.hasMatch(emailC.text)) {
                  Get.snackbar("Pendaftaran Gagal",
                      "Email tidak valid, gunakan email dengan format user@gmail.com");
                  return;
                }
                try {
                  authC.signup(emailC.text, passC.text);
                  emailC.clear();
                  passC.clear();
                  Get.snackbar(
                      "Pendaftaran Berhasil", "Anda berhasil mendaftar.");
                } catch (e) {
                  Get.snackbar("Pendaftaran Gagal", e.toString());
                }
              },
              child: Text("DAFTAR"),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sudah punya akun ? "),
                TextButton(
                  onPressed: () => Get.offAllNamed(Routes.LOGIN),
                  child: Text("LOGIN"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
