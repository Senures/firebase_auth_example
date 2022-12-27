import 'package:firebase_example/modules/model/blog_models.dart';
import 'package:firebase_example/shared/service/firestore_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  var bloglistc = [];

  FireStoreService fireStoreService = FireStoreService();

  setIndexColor(int index) {
    currentIndex.value = index;

    update();
  }

  @override
  void onInit() {
    print("semaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    fireStoreService.getBlogCollection();
    print(fireStoreService.bloglist.length);
    bloglistc = fireStoreService.bloglist;
    print(bloglistc.length);
    //getBlogCollectionData();
    super.onInit();
  }

  /*  getBlogCollectionData() {
   fireStoreService.getBlogCollection()
  } */
}
