import 'package:firebase_auth/firebase_auth.dart';
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
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
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
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
