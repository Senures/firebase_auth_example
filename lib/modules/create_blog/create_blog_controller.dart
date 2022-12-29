import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateBlogController extends GetxController {
  TextEditingController titlec = TextEditingController();
  TextEditingController contentc = TextEditingController();
  TextEditingController categoryc = TextEditingController();
  List<String> images = [
    "https://images.unsplash.com/photo-1614732414444-096e5f1122d5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
    "https://images.unsplash.com/photo-1545156521-77bd85671d30?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
    "https://images.unsplash.com/photo-1462331940025-496dfbfc7564?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=611&q=80"
  ];

  addBlogCollection() async {
    var blogs = FirebaseFirestore.instance.collection("blogs");
    await blogs.add({
      "title": titlec.text,
      "category": categoryc.text,
      "contents": contentc.text,
      "create_date": Timestamp.fromDate(DateTime.now()),
      "read_count": "22",
      "img":
          "https://images.unsplash.com/photo-1592093474530-86874167e896?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTR8fHNwYWNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    });
    Get.back();
  }
}
