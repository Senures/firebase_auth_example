import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_example/main.dart';
import 'package:firebase_example/modules/auth/register/register_controller.dart';
import 'package:firebase_example/modules/home/home_controller.dart';
import 'package:firebase_example/shared/init/sharredpref_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routes/routes.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Obx(() {
            return controller.isEditor.value
                ? const Text("Editor")
                : const Text("User");
          }),
          actions: [
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();

                  // pref?.remove("isEditor");

                  Pref.remove("isEditor");

                  Get.offAndToNamed(Routes.LOGIN);
                },
                icon: Icon(Icons.abc)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                //color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Blog of the week",
                      style: GoogleFonts.oswald(
                          color: const Color(0xff323232),
                          fontSize: 35,
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                      width: 110,
                      height: 5,
                      color: Color(0XFFFF6D3E),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.18,
                decoration: BoxDecoration(
                    color: const Color(0xffE6EDEF),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 120,
                      height: 85,
                      color: Colors.red,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text("Continue Reading?"),
                            SizedBox(
                              width: 50,
                            ),
                            Icon(
                              Icons.close,
                              color: Colors.grey,
                            )
                          ],
                        ),
                        Text(
                          "Creating effective\nprototype that works",
                          style: GoogleFonts.oswald(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        Row(
                          children: [SizedBox()],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
