import 'package:firebase_example/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailView extends GetView<HomeController> {
  /* final String title;
  final String content;
  final String date;
  final String category;
  final String img;
  final String read_count; */
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    var title = Get.parameters["title"];
    var img = Get.parameters["img"];
    return Scaffold(
        backgroundColor: const Color(0xff02102A),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 500,
                        height: 430,
                        //  color: Colors.blue,
                      ),
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: MediaQuery.of(context).size.width,
                        height: 380,
                        decoration: BoxDecoration(
                            //   color: Colors.red,
                            borderRadius: BorderRadius.circular(30)),
                        child: Image.network(
                          img.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          left: 20,
                          top: 30,
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const FaIcon(
                              FontAwesomeIcons.arrowLeft,
                              color: Colors.white,
                              size: 30,
                            ),
                          )),
                      Positioned(
                          bottom: 70,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            //  color: Colors.amber,
                            width: 400,
                            //height: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 300,
                                  //height: 50,
                                  //    color: Colors.red,

                                  child: Text(
                                    title.toString(),
                                    style: GoogleFonts.asap(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 28,
                                        color: Colors.white),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "24.12.2022  .   Cosmos",
                                  style: GoogleFonts.asap(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          )),
                      Obx(
                        () => Positioned(
                            right: 20,
                            bottom: 20,
                            child: InkWell(
                              onTap: () {
                                controller.favorilereEkleme();
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.grey.shade100,
                                maxRadius: 27,
                                child: FaIcon(
                                  controller.isFavori.value
                                      ? FontAwesomeIcons.heartCircleCheck
                                      : FontAwesomeIcons.heart,
                                  size: 26,
                                  color: controller.isFavori.value
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      style: GoogleFonts.asap(
                          color: Colors.white,
                          letterSpacing: .5,
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                  )
                  //Text("${title?.capitalized()}")
                ],
              ),
            ),
          ),
        ));
  }
}

extension StringExtension on String {
  String capitalized() {
    if (this.isEmpty) return this;
    return this[0].toUpperCase() + this.substring(1);
  }
}
