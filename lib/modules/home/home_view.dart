import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_example/modules/create_blog/create_blog.dart';
import 'package:firebase_example/modules/detail/detail_view.dart';
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
        //  title: Text(controller.analyticsService.analytics.),
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
              controller.analyticsService.logEvent();
              /*   FirebaseAuth.instance.signOut();
              Pref.remove("isEditor");
              Get.offAndToNamed(Routes.LOGIN); */
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
              height: 40,
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
                          horizontal: 15,
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
          Obx(() => controller.blogLoading.value
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: MasonryGridView.count(
                    primary: false,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    itemCount: controller.bloglist?.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          controller.deleteBlogDoc(index);
                        },
                        child: Tile(
                          controller: controller,
                          index: index,
                          extent: (index % 3 + 2) * 100 > 300
                              ? 250
                              : (index % 3 + 2) * 100,
                        ),
                      );
                    },
                  ),
                )),
        ],
      ),
      floatingActionButton: Pref.getBool("isEditor") == true
          ? FloatingActionButton(
              backgroundColor: Colors.white,
              child: const FaIcon(
                FontAwesomeIcons.pen,
                color: Color(0xff02102A),
              ),
              onPressed: () {
                Get.toNamed(Routes.ADDBLOG);
              },
            )
          : const SizedBox(),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
    required this.controller,
  });

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      // color: backgroundColor ?? Colors.red,
      height: extent,
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              controller.bloglist![index].img ??
                  "https://images.unsplash.com/photo-1545156521-77bd85671d30?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGxhbmV0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
              fit: BoxFit.cover,
            ),
          ),
          Text(controller.bloglist![index].title,
              style: TextStyle(color: Colors.white)),
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
