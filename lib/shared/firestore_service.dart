import 'package:get/get.dart';

/* class FireStoreService extends GetxService {
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