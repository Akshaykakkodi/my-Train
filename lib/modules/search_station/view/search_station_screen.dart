import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytrain/constants/app_constants.dart';
import 'package:mytrain/modules/search_station/view/station_details_screen.dart';

class SearchStationScreen extends StatelessWidget {
  const SearchStationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController stationNameCntrl=TextEditingController();
    var fkey=GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: const Color(0xffF1DBD8),
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
            
            controller: stationNameCntrl,
            validator: (value) {
              if(value!.isEmpty){
                Get.snackbar("Alert", "Invalid station name");
              }
              
                return null;
              
            },
            
            decoration: InputDecoration(
                hintText: "Search",
                contentPadding: const EdgeInsets.all(10),
                fillColor: Colors.white,
                filled: true,
                suffixIcon: GestureDetector(
                  onTap: () {
                    if(fkey.currentState!.validate()){
                      Get.to( StationDetailsScreen(stationName: stationNameCntrl.text.toString(),));
                    }
                    
                  },
                  child: const Icon(Icons.search_outlined)),
                constraints: const BoxConstraints(maxHeight: 40),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          ),
        ),
      ),
      
    
    );
  }
}