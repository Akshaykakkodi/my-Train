import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mytrain/constants/app_constants.dart';
import 'package:mytrain/modules/search_train/view/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
   Future.delayed(const Duration(seconds:4),(){
      Get.offAll(const Home());
    });
    return Scaffold(
      backgroundColor: AppConstants.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            "assets/icons/train_logo.png",
            scale: 3,
          )),
         const Hero(
            tag: "title",
            child:  Text(
              "My Train",
              style: TextStyle(
                  fontSize: 35, color: Colors.white, fontWeight: FontWeight.w800),
            ),
          ),
          Lottie.asset("assets/icons/Animation - loading.json", height: 150)
        ],
      ),
    );
  }
}
