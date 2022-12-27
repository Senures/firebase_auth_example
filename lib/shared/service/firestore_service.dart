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

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_example/modules/model/blog_models.dart';
import 'package:firebase_example/routes/app_pages.dart';
import 'package:get/get.dart';

class FireStoreService extends GetxService {
  List<BlogModel> bloglist = <BlogModel>[].obs;
  RxBool blogLoading = false.obs;

  createUserCollection(UserCredential credential, String? role) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.doc(credential.user!.uid).set({
      "id": credential.user!.uid,
      "mail": credential.user!.email,
      "role": role ?? "user",
      "isEditor": role == "editor" ? true : false
    });

    Get.toNamed(Routes.LOGIN);
  }

  Future<void> getBlogCollection() async {
    log("FONK BAŞLADI ");
    blogLoading.value = true;
    FirebaseFirestore.instance.collection('blogs').snapshots().listen(
      (event) {
        log("LISTINER BAŞLADI ");
        bloglist.clear();
        for (var element in event.docs) {
          log("FOR BAŞLADI ");
          bloglist.add(BlogModel(
              title: element.data()["title"],
              contents: element.data()["contents"],
              img: element.data()["img"],
              create_date:
                  (element.data()["create_date"] as Timestamp).toDate(),
              read_count: element.data()["read_count"]));
        }

        blogLoading.value = false;
      },
    );
  }
}
