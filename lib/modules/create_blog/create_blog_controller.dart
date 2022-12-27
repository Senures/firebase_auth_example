import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateBlogController extends GetxController {
  TextEditingController titlec = TextEditingController();
  TextEditingController contentc = TextEditingController();
  TextEditingController categoryc = TextEditingController();

  /*   createTodoCollection() async {
    var blogs = FirebaseFirestore.instance
        .collection("blog");
       

    await blogs.add({
      "title": categoryname!.text,
      "content": todoColor, //burda firebase ekledik
      "total_task": "",
    });
  } */

  addBlogCollection() async {
    var blogs = FirebaseFirestore.instance.collection("blogs");
    await blogs.add({
      "title": titlec.text,
      "category": categoryc.text,
      "contents": contentc.text,
      "create_date": Timestamp.fromDate(DateTime.now()),
      "read_count": "22",
      "img":
          "https://images.unsplash.com/photo-1484589065579-248aad0d8b13?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8Y29zbW9zfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
    });
    Get.back();
  }
}
