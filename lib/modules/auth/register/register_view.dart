import 'package:firebase_example/modules/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../routes/routes.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181a20),
      /* appBar: AppBar(
   
      ), */
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              Container(
                //color: Colors.amber,
                width: 500.0,
                height: 100.0,
                child: const Text(
                  "Create your\nAccount",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 39,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              TextFormField(
                  showCursor: false,
                  style: const TextStyle(color: Colors.white),
                  controller: controller.emailcontroller,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color(0xff1ab65c)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ))),
              const SizedBox(
                height: 25,
              ),
              Obx(() {
                return TextFormField(
                    obscureText: controller.isShow.value,
                    showCursor: false,
                    style: const TextStyle(color: Colors.white),
                    controller: controller.passwordcontroller,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            print("tıklandııııııııııııııııııııııııııııııı");
                            controller.showPassword();
                          },
                          icon: controller.isShow.value
                              ? const Icon(Icons.visibility_off_rounded)
                              : const Icon(Icons.visibility),
                          color: Colors.white,
                        ),
                        prefixIcon: const Icon(
                          Icons.key,
                          color: Colors.white,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Color(0xff1ab65c)),
                        ),
                        //beyaz renkli border
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.white),
                        )));
              }),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 200,
                    height: 50,
                    child: TextFormField(
                        showCursor: false,
                        style: const TextStyle(color: Colors.white),
                        controller: controller.referancecontroller,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xff1ab65c)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.white),
                            ))),
                  ),
                  Obx(
                    () => IconButton(
                        onPressed: () {
                          controller.getReferanceCodes();
                        },
                        icon: Icon(
                          Icons.check_circle_outline_sharp,
                          size: 40,
                          color: controller.isCorrect.value
                              ? Colors.green
                              : Colors.grey.shade600,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              MaterialButton(
                onPressed: () {
                  controller.service.createUser(controller.emailcontroller.text,
                      controller.passwordcontroller.text);
                  /*   controller.service.createUser(controller.emailcontroller.text,
                      controller.passwordcontroller.text); */
                },
                minWidth: 300,
                height: 45,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: const Color(0xff1ab65c),
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Row(children: const [
                  Expanded(
                      child: Divider(
                    endIndent: 10,
                    indent: 10,
                    color: Colors.white,
                  )),
                  Text(
                    "or continue with",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Colors.white,
                  )),
                ]),
              ),
              Container(
                width: 300,
                height: 60,
                //color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    socialContainer(
                        Icons.facebook, Color.fromARGB(255, 37, 103, 158)),
                    socialContainer(Icons.face, Colors.red),
                    socialContainer(Icons.apple, Colors.white),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              color: Color(0xff1ab65c),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

socialContainer(IconData icon, Color colors) {
  return Container(
    alignment: Alignment.center,
    width: 70,
    height: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 2, color: Colors.white24)),
    child: Icon(
      icon,
      color: colors,
    ),
  );
}
