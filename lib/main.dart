import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mytrain/modules/search_station/controller/station_controller.dart';
import 'package:mytrain/modules/search_train/controller/train_controller.dart';
import 'package:mytrain/splash_screen.dart';

void main() {
 
  runApp(const MyApp());
  Get.put(TrainController());
  Get.put(StationController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return GetMaterialApp(
      title: 'My train',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
    );
  }
}


