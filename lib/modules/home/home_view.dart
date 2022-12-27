import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_example/modules/create_blog/create_blog.dart';
import 'package:firebase_example/modules/home/home_controller.dart';
import 'package:firebase_example/shared/init/sharredpref_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff02102A),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff02102A),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Image.network(
            "https://cdn-icons-png.flaticon.com/512/3018/3018445.png",
            width: 40,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text(controller.fireStoreService.bloglist.length.toString()),
        /*  Container(
          //color: Colors.red,
          width: 80,
          height: 60,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Switch(
              value: true,
              onChanged: (value) {},
              activeTrackColor: Colors.grey.shade200,
              activeColor: Colors.white,
            ),
          ),
        ), */
        actions: [
          InkWell(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Pref.remove("isEditor");
              Get.offAndToNamed(Routes.LOGIN);
            },
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: Colors.grey.shade300,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            // color: Colors.amber,
            height: 75,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Discover",
                  style: GoogleFonts.asap(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "New articles",
                  style: GoogleFonts.asap(
                      color: Colors.white30,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              height: 45,
              //color: Colors.red,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.setIndexColor(index);
                    },
                    child: Obx(
                      () => Container(
                        alignment: Alignment.center,
                        width: 100,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                            color: controller.currentIndex == index
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.white38)),
                        child: Obx(
                          () => Text(
                            "Comedy",
                            style: TextStyle(
                                color: controller.currentIndex == index
                                    ? const Color(0xff02102A)
                                    : Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: MasonryGridView.count(
              primary: false,
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemCount: controller.fireStoreService.bloglist.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    log(((index % 5 + 1) * 100).toString());
                  },
                  child: Tile(
                    index: index,
                    extent: (index % 3 + 2) * 100 > 300
                        ? 250
                        : (index % 3 + 2) * 100,
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: Pref.getBool("isEditor") == true
          ? FloatingActionButton(
              backgroundColor: const Color(0xff02102A),
              child: const FaIcon(FontAwesomeIcons.pen),
              onPressed: () {
                Get.to(CreateBlogView());
              },
            )
          : const SizedBox(),
    );
  }
}

class Tile extends GetView<HomeController> {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      // color: backgroundColor ?? Colors.red,
      height: extent,
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              controller.fireStoreService.bloglist[index].img
                      .replaceAll("\"", "") ??
                  "https://images.unsplash.com/photo-1545156521-77bd85671d30?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGxhbmV0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
              fit: BoxFit.cover,
            ),
          ),
          Text("TARİH"),
        ],
      ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}
