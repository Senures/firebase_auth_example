import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_example/shared/service/auth_service.dart';
import 'package:firebase_example/shared/service/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController referancecontroller = TextEditingController();
  AuthService service = AuthService();
  FireStoreService fireStoreService = FireStoreService();
  RxBool isShow = true.obs;
  RxBool isCorrect = false.obs;

  String? userType;
  String? userRole;

  showPassword() {
    isShow.value = !isShow.value;
  }

  userRoles() async {
    if (referancecontroller.text == "editor") {
      userType = referancecontroller.text;
      isCorrect.value = true;
    } else {
      isCorrect.value = false;
      userType = null;
      referancecontroller.clear();
      Get.snackbar("HATA", 'Geçersiz referans kodu.',
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
    }
    update();
  }
}
