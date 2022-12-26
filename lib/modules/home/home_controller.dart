import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;

  setIndexColor(int index) {
    currentIndex.value = index;
    
    update();
  }
}
