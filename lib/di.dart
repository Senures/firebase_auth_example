import 'package:firebase_example/shared/service/firebase_service.dart';
import 'package:get/get.dart';

class DenpendencyInjection {
  static init() async {
    await Get.putAsync(() => FirebaseService().init());
  }
}
