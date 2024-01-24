import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytrain/constants/app_constants.dart';
import 'package:mytrain/modules/search_station/model/station_model.dart';

class StationController extends GetxController{
  final Dio dio=Dio();
  Rx<StationModel> stationModel=StationModel().obs;

  var fromStationCntrl=TextEditingController().obs;
   var toStationCntrl=TextEditingController().obs;


   invertControllers(){
    var temp=fromStationCntrl.value;
    fromStationCntrl.value=TextEditingController(text:toStationCntrl.value.text );
    toStationCntrl.value=TextEditingController(text: temp.text);

   }

var isLoading=false.obs;
  getStation(String stationName)async{
    isLoading.value=true;
    try{
      var response= await dio.get(AppConstants.baseUrl+"v1/searchStation",
      queryParameters: {"query":stationName},
      options: Options(headers: {
            'X-RapidAPI-Key': AppConstants.apiKey,
            'X-RapidAPI-Host': 'irctc1.p.rapidapi.com'
          })
      );
      stationModel.value=StationModel.fromJson(response.data);
    }
    catch(e){
      throw e.toString();
    }
    isLoading.value=false;
  }



getTrainsBtwStations(String fromStation,String toStation,DateTime date)async{
    try{
 isLoading.value=true;

      var response= await dio.get(AppConstants.baseUrl+"v3/trainBetweenStations",
      queryParameters:{
    "fromStationCode": fromStation,
    "toStationCode": toStation,
    "dateOfJourney": date
  },
      options: Options(headers: {
            'X-RapidAPI-Key': AppConstants.apiKey,
            'X-RapidAPI-Host': 'irctc1.p.rapidapi.com'
          })
      );
      stationModel.value=StationModel.fromJson(response.data);
    }
    catch(e){
      throw e.toString();
    }
    finally{
       isLoading.value=false;
    }
   
  }
}