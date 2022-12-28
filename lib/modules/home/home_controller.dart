import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_example/modules/model/blog_models.dart';
import 'package:firebase_example/shared/service/analytics_service.dart';
import 'package:firebase_example/shared/service/firestore_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;

  FireStoreService fireStoreService = FireStoreService();

  List<BlogModel>? bloglist = <BlogModel>[].obs;
  RxBool blogLoading = false.obs;

  //analytic service başlattı
  AnalyticsService analyticsService = Get.find();

  setIndexColor(int index) {
    currentIndex.value = index;

    update();
  }

  @override
  Future<void> onInit() async {
    fireStoreService.getBlogCollection();
    blogLoading.value = true;

    bloglist = fireStoreService.bloglist;
    blogLoading.value = false;
    super.onInit();
  }

  deleteBlogDoc(int index) async {
    var collection = FirebaseFirestore.instance.collection('blogs');
    var snapshot = await collection.get();
    snapshot.docs[index].reference.delete();
  }
}
