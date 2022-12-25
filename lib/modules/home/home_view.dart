import 'package:firebase_example/modules/detail/detail_view.dart';
import 'package:firebase_example/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.randomlist.shuffle(); //shuffle over here
    controller.imagePath =
        controller.randomlist[0]; //store random image over here
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: FaIcon(
            FontAwesomeIcons.bars,
            color: Colors.black,
            size: 27,
          ),
        ),
        actions: [
          Container(
            // clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.only(right: 15, bottom: 10),
            //padding: EdgeInsets.all(20),

            width: 42.0,
            height: 42.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
                border: Border.all(color: const Color(0xff044C5D), width: 4)),
            child: const CircleAvatar(
              backgroundColor: Color(0xff044C5D),
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8d29tZW58ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                //color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.end,
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
                      color: const Color(0XFFFF6D3E),
                    ),
                  ],
                ),
              ),
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.18,
                decoration: BoxDecoration(
                    color: const Color(0xffE6EDEF),
                    borderRadius: BorderRadius.circular(10)),
                child: Image.network(controller.imagePath!, fit: BoxFit.cover),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 38,
                //color: Colors.red,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      width: 70,
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xff044C5D),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: const Text(
                        "Populer",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(DetailView());
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: 200,
                      height: 130,
                      /*     decoration: BoxDecoration(
                          color: Colors.white,
                          /*  boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 2,
                                spreadRadius: 2),
                          ], */
                        ), */
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            width: 130,
                            height: 120,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.network(
                              "https://images.unsplash.com/photo-1484415063229-3d6335668531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTUwfHxibG9nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                //  width: 50,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                height: 25,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Text(
                                  "Design",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                              Text(
                                "Building a succesful\nDesign System",
                                style: GoogleFonts.oswald(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600),
                              ),
                              Container(
                                width: 90,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    FaIcon(
                                      FontAwesomeIcons.circle,
                                      size: 8,
                                      color: Colors.black,
                                    ),
                                    Text("5 min read")
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              FaIcon(FontAwesomeIcons.ellipsisVertical),
                              FaIcon(
                                FontAwesomeIcons.solidBookmark,
                                color: Color(0xff044C5D),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0XFFFF6D3E),
        onPressed: () {},
        child: FaIcon(FontAwesomeIcons.pencil),
      ),
    );
  }
}
