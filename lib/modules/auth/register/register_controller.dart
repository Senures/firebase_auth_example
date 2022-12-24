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
  bool obscureText = false;
  RxBool isCorrect = false.obs;

  String? userType;
  String? userRole;
  //burda yazdıgı değer firestorden gelen kodla
  //eşleşiyorsa

  showPassword() {
    print("showpasswprdu çalıştı");
    print(obscureText);
    isShow.value = !isShow.value;
    obscureText = !obscureText;
    print(obscureText);
  }

 /*  getUserType() {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .snapshots()
        .listen((event) {
      print(event.data()!["role"]);
    });
  } */

  getReferanceCodes() async {
    //burda doc yazmadan gçremiyorum idsini buna bi bak
    await FirebaseFirestore.instance
        .collection('codes')
        .doc("QgXGsQRZqIQIaarwTWXE")
        .snapshots()
        .listen((event) {
      userType = event.data()!["editor"];
    });
    userRoles();
  }

  userRoles() async {
    if (referancecontroller.text == userType) {
      print("eşitttttttttttt");

      isCorrect.value = true;
    } else {
      isCorrect.value = false;
      print("değillllllllllllllll");
    }
  }
}
