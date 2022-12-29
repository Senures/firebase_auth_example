import 'package:firebase_example/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePage extends GetView<HomeController> {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "2",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
