import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*   appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text("Gamification:Article",
            style: GoogleFonts.oswald(
                color: Colors.black,
                fontSize: 23,
                fontWeight: FontWeight.w500)),
      ), */
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Container(
                  height: 70,
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.black,
                      ),
                      Text("Gamification:Article",
                          style: GoogleFonts.oswald(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.w500)),
                      const FaIcon(
                        FontAwesomeIcons.solidBookmark,
                        color: Color(0xff044C5D),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 320,
                height: 200,
                //color: Colors.amber,
                child: Text("The Future of\nGamfication in\nEducation",
                    style: GoogleFonts.oswald(
                        letterSpacing: .5,
                        color: Colors.black,
                        fontSize: 42,
                        fontWeight: FontWeight.w700)),
              ),
              Text("By:Joshua Hong    |    December 14,2022",
                  style: GoogleFonts.oswald(
                      letterSpacing: .5,
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.normal)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                    "Lorem Ipsum is  also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                    style: GoogleFonts.oswald(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
              ),
              Center(
                child: Container(
                  height: 150,
                  color: Colors.amber,
                  child: Image.network(
                      "https://images.unsplash.com/photo-1585241936939-be4099591252?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8YXJ0aWNsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                    "Lorem Ipsum is  also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                    style: GoogleFonts.oswald(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
