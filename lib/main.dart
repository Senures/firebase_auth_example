import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_example/di.dart';
import 'package:firebase_example/shared/init/sharredpref_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';

User? auth = FirebaseAuth.instance.currentUser;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Pref.init();
  await DenpendencyInjection.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: auth == null ? Routes.LOGIN : Routes.HOME,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const LoginView(),
      //EĞER GET PAGES VE İNİTİAL ROUTE VARSA HOMEU KAPA,YOKSSA İNİTİAL BİNDİNG AÇ
      getPages: AppPages.routes,
      //routes: MyApp,
      //initialBinding: LoginBinding(),
    );
  }
}
