import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async {
    //createUser();
    return this;
  }

  createUser(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential == null) {
        print("kullanıcı oluşturulmadı");
      } else {
        Get.toNamed(Routes.LOGIN);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.snackbar("PLEASE", 'The password provided is too weak.',
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.snackbar("PLEASE", 'The account already exists for that email.',
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
      }
    } catch (e) {
      print(e);
    }
  }

  account(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("Giriş yapıldı ${credential.user?.email}");
      Get.snackbar("CORRECT", 'Tebrikler giriş başarılı',
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
      Get.toNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.snackbar("ERROR", 'No user found for that email.',
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.snackbar("ERROR", 'Wrong password provided for that user.',
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
      }
    }
  }
}
