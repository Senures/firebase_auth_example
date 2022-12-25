

import 'package:firebase_example/modules/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => HomeController());
  }
}
