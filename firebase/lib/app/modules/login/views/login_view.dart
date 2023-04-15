import 'package:firebase/app/controllers/auth_controller.dart';
import 'package:firebase/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final emailC = TextEditingController();
  final passC = TextEditingController();

  bool _obscureText = true;

  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                  ),
                ),
                Container(
                  height: 350,
                  width: 400,
                  transformAlignment: Alignment.center,
                  child: LottieBuilder.asset("assets/login.json"),
                ),
                SizedBox(height: 30),
                Column(
                  children: [
                    TextField(
                      controller: emailC,
                      decoration: InputDecoration(
                        labelText: "Email",
                        contentPadding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 30, vertical: 20),
                        prefixIcon: const Icon(Icons.email),
                        hintText: "username@email.com",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: passC,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: "Password",
                        contentPadding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 30, vertical: 20),
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () => authC.login(emailC.text, passC.text),
                      child: Text("Login"),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Belum punya akun ? "),
                    TextButton(
                      onPressed: () => Get.toNamed(Routes.SIGNUP),
                      child: Text("Daftar Sekarang"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
