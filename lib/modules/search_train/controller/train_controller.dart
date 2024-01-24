import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:mytrain/constants/app_constants.dart';
import 'package:mytrain/modules/search_train/model/train_live_status_model.dart';
import 'package:mytrain/modules/search_train/model/train_schedule_model.dart';
import 'package:mytrain/modules/search_train/model/train_search_model.dart';
import 'package:mytrain/response.dart';


class TrainController extends GetxController {
  final Dio dio = Dio();
  var date=DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;

  var isSearchingTrain = false.obs;
  var isNonStopsVisible = false.obs;


  Rx<TrainSearchModel> trainSearchModel =
      TrainSearchModel(data: [], message: "", status: false, timestamp: 0).obs;

  Rx<TrainScheduleModel> trainScheduleModel = TrainScheduleModel(
      status: false,
      message: '',
      timestamp: 0,
      data: Data(
          trainType: "",
          trainNumber: "",
          trainName: "",
          runDays: RunDays(
              sun: false,
              mon: false,
              tue: false,
              wed: false,
              thu: false,
              fri: false,
              sat: false),
          route: [])).obs;

  

  toggleNonStop() {
    isNonStopsVisible.value = !isNonStopsVisible.value;
    update();
  }

Rx<TrainLiveStatusModel> trainLiveStatusModel=TrainLiveStatusModel().obs;



// search train using train number
  searchTrain(int trainNumber) async {
    
    try {
      isSearchingTrain.value = true;
      var response = await dio.get("${AppConstants.baseUrl}v1/searchTrain",
          queryParameters: {"query": trainNumber},
          options: Options(headers: {
            'X-RapidAPI-Key': AppConstants.apiKey,
            'X-RapidAPI-Host': 'irctc1.p.rapidapi.com'
          }));
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        if (response.data != null) {
          trainSearchModel.value = TrainSearchModel.fromJson(response.data);
          log(trainSearchModel.value.data.length.toString());
        }
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
    finally{
       isSearchingTrain.value = false;
    }
   
  }

var isLoading=false.obs;

// get trainschedule 
  getTrainSchedule(String trainNumber) async {
    
    try {
      isLoading.value=true;
      var response = await dio.get("${AppConstants.baseUrl}v1/getTrainSchedule",
          queryParameters: {"trainNo": trainNumber},
          options: Options(headers: {
            'X-RapidAPI-Key': AppConstants.apiKey,
            'X-RapidAPI-Host': 'irctc1.p.rapidapi.com'
          }));
      log(response.statusCode.toString());
      
      if (response.statusCode == 200) {
        if (response.data != null) {
          log("data is not null");
          trainScheduleModel.value = TrainScheduleModel.fromJson(response.data);
          log(trainScheduleModel.value.data.route[0].stop.toString());
          log(trainScheduleModel.value.data.trainType);
        }
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log("message");
      log(e.toString());
    }
    finally{
       isLoading.value=false;
    }
   
  }



RxInt lengthOfPreviousStations=0.obs;
// to track train live status
getTrainLiveStatus(String trainNumber)async{

try{
  isLoading.value=true;

//   var response=await dio.get("https://irctc1.p.rapidapi.com/api/v1/liveTrainStatus",
//     //AppConstants.baseUrl+"v1/liveTrainStatus",
//    queryParameters:{"trainNo":trainNumber} ,
//     options: Options(headers: { 'X-RapidAPI-Key': AppConstants.apiKey,
//     'X-RapidAPI-Host': 'irctc1.p.rapidapi.com'})
//     );
//     log(response.statusCode.toString());
//     // log('api res $response');
//     log(response.statusMessage.toString());
//     if(response.statusCode==200){
//       if(response.data!=null){
//         log("data is not null");
// trainLiveStatusModel.value=TrainLiveStatusModel.fromJson(response.data);
// lengthOfPreviousStations.value=((trainLiveStatusModel.value.data?.previousStations)?.length??0);
// log('api responce ${trainLiveStatusModel.value.data?.upcomingStations?.length}');
//       }

//     }
var response= Dummy.acc;
trainLiveStatusModel.value=TrainLiveStatusModel.fromJson(response);

 log('api responce ${trainLiveStatusModel.value.data?.upcomingStations!.length}');
}catch(e){
  log(e.toString());

}
finally{
  isLoading.value=false;
}


}




pickDate(BuildContext context)async{
  var pickedDate= await showDatePicker(
    context: context,
     initialDate: DateTime.now(), 
     firstDate: DateTime.now(), 
     lastDate: DateTime(2100));


     date.value=DateFormat('yyyy-MM-dd').format(pickedDate!);
     update();
}



}
