import 'package:firebase_example/modules/auth/login/login_bindings.dart';
import 'package:firebase_example/modules/auth/login/login_view.dart';
import 'package:firebase_example/di.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DenpendencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.LOGIN,
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
