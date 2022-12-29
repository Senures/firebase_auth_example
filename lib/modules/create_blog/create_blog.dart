import 'package:firebase_example/modules/create_blog/create_blog_controller.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CreateBlogView extends GetView<CreateBlogController> {

  const CreateBlogView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff02102A),
      appBar: AppBar(
        toolbarHeight: 120,
        centerTitle: true,
        title: const Text(
          "Write Blog",
          style: TextStyle(
              fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xff02102A),
        elevation: 0,
        leadingWidth: 80,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            customTextForm(
                "Lets think of something great for you article title",
                60.0,
                controller.titlec),
            customTextForm("Choose a category", 60.0, controller.categoryc),
            customTextForm(
                "What do you have to write?", 200.0, controller.contentc),
            Center(
              child: InkWell(
                onTap: () {
                  controller.addBlogCollection();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    "Publish",
                    style: TextStyle(
                        letterSpacing: .5,
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

customTextForm(
    String text, double? height, TextEditingController? textcontroller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          text,
          // "Lets think of something great for you article title",
          style: const TextStyle(color: Colors.white54),
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
            color: Colors.white10, borderRadius: BorderRadius.circular(10)),
        height: height,
        child: TextFormField(
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white),
          controller: textcontroller,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
      const SizedBox(
        height: 15,
      )
    ],
  );
}
