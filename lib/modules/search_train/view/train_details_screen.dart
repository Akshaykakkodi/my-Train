

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytrain/constants/app_constants.dart';
import 'package:mytrain/modules/search_train/controller/train_controller.dart';

class TrainDetailsScreen extends StatelessWidget {
  final String trainNumber;

  const TrainDetailsScreen({super.key, required this.trainNumber,});

  @override
  Widget build(BuildContext context) {
    TrainController trainController =Get.find();
    trainController.getTrainSchedule(trainNumber);
    // log(trainNumber);

    return Obx(
      () => 
       Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstants.primaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          title:  Text(
    
             trainController.trainScheduleModel.value.data.trainName ,
            style:const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 60,
              color: AppConstants.primaryColor,
              child: Row(children: [
                const SizedBox(
                  width: 30,
                ),
                Text("Run Days",style: TextStyle(color: Colors.white),),
                SizedBox(width: 10,),

                Container(
                  color: Colors.white,
                  padding:EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Sun,",style: TextStyle(
                        color: trainController.trainScheduleModel.value.data.runDays.sun?Colors.green:Colors.red
                      ),),
                      Text("Mon,,",style: TextStyle(
                        color: trainController.trainScheduleModel.value.data.runDays.mon?Colors.green:Colors.red
                      ),),
                      Text("Tue,",style: TextStyle(
                        color: trainController.trainScheduleModel.value.data.runDays.tue?Colors.green:Colors.red
                      ),),
                      Text("wed,",style: TextStyle(
                        color: trainController.trainScheduleModel.value.data.runDays.wed?Colors.green:Colors.red
                      ),),
                      Text("Thu,",style: TextStyle(
                        color: trainController.trainScheduleModel.value.data.runDays.thu?Colors.green:Colors.red
                      ),),
                      Text("Fri,",style: TextStyle(
                        color: trainController.trainScheduleModel.value.data.runDays.fri?Colors.green:Colors.red
                      ),),
                      Text("Sat",style: TextStyle(
                        color: trainController.trainScheduleModel.value.data.runDays.sat?Colors.green:Colors.red
                      ),)
                    ],
                  ),
                )

              ]),
            ),
            Container(
              height: 50,
              padding:const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              color: Colors.black,
              child:const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Arrival",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Departure",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                color:const Color(0xffF1DBD8),
                padding:const EdgeInsets.symmetric(vertical: 10),
                child:trainController.isSearchingTrain.value?Container(height: 50, child:const Center(child: CircularProgressIndicator())):
                 ListView.builder(
                  itemCount: trainController.trainScheduleModel.value.data.route.length ,
                  itemBuilder: (context, index) {

                    
                    return 
                    trainController.trainScheduleModel.value.data.route[index].stop==true?
                    Container(
                      width: double.infinity,
                      
                      padding:const EdgeInsets.symmetric(horizontal: 10),
                      color:trainController.trainScheduleModel.value.data.route[index].stop? const Color(0xffF1DBD8):Colors.blueGrey,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text("00:00"),
                              
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 10,
                            height: 80,
                            color: Colors.blue[100],
                            child: const CircleAvatar(
                                radius: 3, backgroundColor: Colors.blue),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 210,
                                child: Expanded(child: Text(trainController.trainScheduleModel.value.data.route[index].station_name.toString(),style: TextStyle(
                                  fontSize: 13
                                ),))),
                             const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(trainController.trainScheduleModel.value.data.route[index].distance_from_source.toString()+" km",style: TextStyle(
                                  fontSize: 13
                                ),),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                 const Text("platform"),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    padding:
                                       const EdgeInsets.symmetric(horizontal: 5),
                                       color: Colors.white,
                                    child: Text(trainController.trainScheduleModel.value.data.route[index].platform_number.toString()),
                                    
                                  ),
                                ],
                              )
                            ],
                          ),
                        const  Spacer(),
                          Column(
                            children: [
                              Text("00:00"),
                              
                            ],
                          ),
                        ],
                      ),
                    ):




                     Visibility(
                      visible:true ,
                      replacement: GestureDetector(
                        onTap: () {
                          trainController.toggleNonStop();
                        },
                        child: Container(height: 3,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:67.0),
                              child: Container(
                                      width: 10,
                                      height: 80,
                                      color: Colors.blue[100],
                                      
                                    ),
                            ),
                          ],
                        ),
                        ),
                      ),
                       child: GestureDetector(
                        onTap: () {
                          trainController.toggleNonStop();
                        },
                         child: Container(
                          width: double.infinity,
                          
                          padding:const EdgeInsets.symmetric(horizontal: 10),
                          color:trainController.trainScheduleModel.value.data.route[index].stop? const Color(0xffF1DBD8):Colors.blueGrey,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text("00:00"),
                                 
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 10,
                                height: 80,
                                color: Colors.blue[100],
                                child: const CircleAvatar(
                                    radius: 3, backgroundColor: Colors.blue),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 160,
                                    child: Expanded(
                                      child: Text(trainController.trainScheduleModel.value.data.route[index].station_name.toString(),style: TextStyle(
                                      fontSize: 13
                                                                    ),),
                                    ),
                                  ),
                                 const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(trainController.trainScheduleModel.value.data.route[index].distance_from_source.toString()+" km",style: TextStyle(
                                  fontSize: 13
                                ),),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text("platform"),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        padding:
                                           const EdgeInsets.symmetric(horizontal: 5),
                                            color: Colors.white,
                                        child: Text(trainController.trainScheduleModel.value.data.route[index].platform_number.toString()),
                                       
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            const  Spacer(),
                              Column(
                                children: [
                                  Text("00:00"),
                                  
                                ],
                              ),
                            ],
                          ),
                                           ),
                       ),
                     );
                    
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
