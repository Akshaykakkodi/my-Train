import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mytrain/constants/app_constants.dart';
import 'package:mytrain/modules/search_station/controller/station_controller.dart';

class StationDetailsScreen extends StatelessWidget {
  final String stationName;
  const StationDetailsScreen({super.key, required this.stationName});

  @override
  Widget build(BuildContext context) {
    StationController stationController=Get.put(StationController());
    stationController.getStation(stationName);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.primaryColor,
        iconTheme:const IconThemeData(color: Colors.white),

      ),

      body:Obx(
        () => 
         SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: ListView.separated(
             
            separatorBuilder: (context, index) {
              return const Divider();
            }, 
            itemCount: stationController.stationModel.value.data?.length??0,
            itemBuilder: (context, index) {

              return  stationController.isLoading.value? SizedBox(
                height: 100,
                child: Lottie.asset("assets/icons/circle_loading.json")):
               ListTile(
                leading: Container(
                  padding:const EdgeInsets.all(5),
                  color: AppConstants.primaryColor,
                  child: Text(stationController.stationModel.value.data![index].code.toString(),style:const TextStyle(color: Colors.white,fontSize: 17),),
                ),
            title: Text(stationController.stationModel.value.data![index].name.toString()),
            subtitle: Text(stationController.stationModel.value.data![index].stateName.toString()),
              );
            },
            ),
        ),
      ) ,
    );


  }
}