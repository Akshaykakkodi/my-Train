import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mytrain/constants/app_constants.dart';
import 'package:mytrain/modules/search_train/controller/train_controller.dart';
import 'package:mytrain/modules/search_train/view/train_live_screen.dart';


class SearchLiveTrainScreen extends StatefulWidget {
  const SearchLiveTrainScreen({super.key});

  @override
  State<SearchLiveTrainScreen> createState() => _SearchLiveTrainScreenState();
}

class _SearchLiveTrainScreenState extends State<SearchLiveTrainScreen> {
  TextEditingController trainNumberCntrl = TextEditingController();
 
  @override
  void dispose() {
    trainNumberCntrl.clear();
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    TrainController trainController = Get.find();
    
    var fkey=GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppConstants.primaryColor,
        iconTheme:const IconThemeData(
          color: Colors.white
        ),
        centerTitle: true,
        title: Form(
          key: fkey,
          child: TextFormField(
            textAlign: TextAlign.justify,
            
            controller: trainNumberCntrl,
            validator: (value) {
              if(value!.isEmpty){
                Get.snackbar("Alert", "Please enter valid train number");
              }
              if(value.length!=5){
                Get.snackbar("Alert", "Please enter valid train number");
              }              
                return null;
              
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: "Train No",
                contentPadding: const EdgeInsets.all(10),
                fillColor: Colors.white,
                filled: true,
                suffixIcon: GestureDetector(
                  onTap: () {
                    if(fkey.currentState!.validate()){
                      trainController.getTrainLiveStatus(trainController.toString());
                      Get.to( TrainLiveScreen(trainNumber: trainNumberCntrl.text.toString(),));
                      log(fkey.currentState!.validate().toString());
                    }
                    else{
                      log("navigate");
                    }
                    
                  },
                  child: const Icon(Icons.search_outlined)),
                constraints: const BoxConstraints(maxHeight: 40),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Lottie.asset("assets/icons/train_animation.json"),
            ),
          )
        ],
      ),
      
    
    );
  }
}
