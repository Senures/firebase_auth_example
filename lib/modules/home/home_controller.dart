import 'package:get/get.dart';

import '../../shared/init/sharredpref_manager.dart';

class HomeController extends GetxController {
  RxBool isEditor = false.obs;

  HomeController() {
    getIsEditor();
  }

  getIsEditor() async {
    // isEditor.value = pref?.getBool("isEditor") ?? false;

    isEditor.value = Pref.getBool("isEditor");
  }
}
