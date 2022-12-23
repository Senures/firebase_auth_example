import 'package:firebase_example/shared/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  AuthService service = AuthService();
  bool isShow = false;
  bool obscureText = false;

  showPassword() {
    print("showpasswprdu çalıştı");
    print(obscureText);
    isShow = !isShow;
    obscureText = !obscureText;
    print(obscureText);
  }
}
