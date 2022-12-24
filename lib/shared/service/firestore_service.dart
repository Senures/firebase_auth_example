/* import 'package:get/get.dart';

class FireStoreService extends GetxService {
  createTodoCollection() async {
    //koleksiyon içine alt koleksiyon açmak
    var to_do = FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("to_do");

    await to_do.add({
      "category_name": categoryname!.text,
      "task_color": todoColor, //burda firebase ekledik
      "total_task": "",
    });
  }
}
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_example/routes/app_pages.dart';
import 'package:get/get.dart';

class FireStoreService extends GetxService {
  createUserCollection(UserCredential credential) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.doc(credential.user!.uid).set({
      "id": credential.user!.uid,
      "mail": credential.user!.email,
      "role": "user",
    });
    Get.toNamed(Routes.LOGIN);
  }
}