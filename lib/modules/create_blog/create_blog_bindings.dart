import 'package:firebase_example/modules/create_blog/create_blog_controller.dart';
import 'package:get/get.dart';

class CreateBlogBinding implements Bindings {
  
  // controller başlatıyor burası
  // nasıl controllerı neden burda baslatıoz dersek çünki
  // view tarafında getview kullanmak için 

  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => CreateBlogController());
  }
}
