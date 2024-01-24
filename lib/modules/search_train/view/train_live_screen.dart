import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytrain/constants/app_constants.dart';
import 'package:mytrain/modules/search_train/controller/train_controller.dart';

class TrainLiveScreen extends StatelessWidget {
  final String trainNumber;
  const TrainLiveScreen({super.key, required this.trainNumber});

  @override
  Widget build(BuildContext context) {
    TrainController trainController = Get.find();
    trainController.getTrainLiveStatus(trainNumber);
    ScrollController scrollController=ScrollController();
    
    
     void _scrollToIndex(int index) {
    scrollController.animateTo(
      index * 70.0, 
      duration:const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
   
  }
    return Obx(
      () => 

  trainController.isLoading.value?  Scaffold(
    appBar: AppBar(
      backgroundColor: AppConstants.primaryColor,
    ),
    backgroundColor: const Color(0xffF1DBD8) ,
    body:const Center(child: CircularProgressIndicator()),
  ):

       Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstants.primaryColor,
          title: Expanded(
            child: Text(
              (trainController.trainLiveStatusModel.value.data?.trainNumber)
                      .toString() +
                  "-" +
                  (trainController.trainLiveStatusModel.value.data?.trainName)
                      .toString(),
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body:
            //   trainController.isSearchingTrain.value?
            //  const Center(child: CircularProgressIndicator()):
            Column(
          children: [
            Container(
              height: 60,
              color: AppConstants.primaryColor,
              child: Row(children: [
                const SizedBox(
                  width: 30,
                ),
                DropdownButtonFormField(
                  value: "Today",
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    constraints: BoxConstraints(maxHeight: 35, maxWidth: 120),
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  items: const [
                    DropdownMenuItem(
                      value: "Today",
                      child: Text("Today"),
                    ),
                    DropdownMenuItem(
                      value: "1",
                      child: Text("Yesterday"),
                    ),
                    DropdownMenuItem(
                      value: "2",
                      child: Text("2 days ago"),
                    ),
                    DropdownMenuItem(
                      value: "3",
                      child: Text("3 days ago"),
                    ),
                  ],
                  onChanged: (value) {},
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 35,
                    color: Colors.white,
                    child: Expanded(
                        child: Text(
                      trainController.trainLiveStatusModel.value.data?.runDays
                              .toString() ??
                          "",
                      style: const TextStyle(fontSize: 12),
                    )),
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ]),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Arrival",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Started on ${trainController.trainLiveStatusModel.value.data?.trainStartDate.toString().split(' ').first}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Text(
                    "Departure",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: const Color(0xffF1DBD8),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: trainController.isSearchingTrain.value
                    ? Container(
                        height: 50,
                        child: const Center(child: CircularProgressIndicator()))
                    : ListView.builder(
                      controller: scrollController,
                        itemCount:( (trainController.trainLiveStatusModel.value
                                    .data?.previousStations)?.length??0) +
                            ((trainController.trainLiveStatusModel.value.data?.upcomingStations)?.length??0),
                        itemBuilder: (context, index) {
                          var bIndex = index -(trainController.trainLiveStatusModel.value.data?.previousStations?.length)!;
                              
                                  
                          return
                              // building previous station data
                              index <
                                      (trainController.trainLiveStatusModel.value
                                              .data?.previousStations)!
                                          .length
                                  ? Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text((trainController
                                                      .trainLiveStatusModel
                                                      .value
                                                      .data
                                                      ?.previousStations![index]
                                                      .sta)
                                                  .toString()),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                (trainController
                                                        .trainLiveStatusModel
                                                        .value
                                                        .data
                                                        ?.previousStations?[index]
                                                        .eta)
                                                    .toString(),
                                                style: TextStyle(
                                                    color: (trainController
                                                                .trainLiveStatusModel
                                                                .value
                                                                .data
                                                                ?.previousStations![
                                                                    index]
                                                                .arrivalDelay??0) >
                                                            0
                                                        ? Colors.red
                                                        : Colors.green),
                                              )
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
                                                radius: 3,
                                                backgroundColor: Colors.blue),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text((trainController
                                                      .trainLiveStatusModel
                                                      .value
                                                      .data
                                                      ?.previousStations?[index]
                                                      .stationName)
                                                  .toString()),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                children: [
                                                  Text((trainController
                                                              .trainLiveStatusModel
                                                              .value
                                                              .data
                                                              ?.previousStations?[
                                                                  index]
                                                              .distanceFromSource)
                                                          .toString() +
                                                      " km"),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  const Text("platform"),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(horizontal: 5),
                                                    color: Colors.white,
                                                    child: Text((trainController
                                                            .trainLiveStatusModel
                                                            .value
                                                            .data
                                                            ?.previousStations![
                                                                index]
                                                            .platformNumber)
                                                        .toString()),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            children: [
                                              Text((trainController
                                                      .trainLiveStatusModel
                                                      .value
                                                      .data
                                                      ?.previousStations![index]
                                                      .std)
                                                  .toString()),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                (trainController
                                                        .trainLiveStatusModel
                                                        .value
                                                        .data
                                                        ?.previousStations![index]
                                                        .etd)
                                                    .toString(),
                                                style: TextStyle(
                                                    color: (trainController
                                                                .trainLiveStatusModel
                                                                .value
                                                                .data
                                                                ?.previousStations![
                                                                    index]
                                                                .arrivalDelay)! >
                                                            0
                                                        ? Colors.red
                                                        : Colors.green),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  : index ==
                                          (trainController.trainLiveStatusModel.value
                                              .data?.previousStations)!
                                          .length
                                      ?
    
                                      // building current station data
                                      Stack(children: [
                                          Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Text((trainController
                                                            .trainLiveStatusModel
                                                            .value
                                                            .data
                                                            ?.curStnSta)
                                                        .toString()),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      (trainController
                                                              .trainLiveStatusModel
                                                              .value
                                                              .data
                                                              ?.eta)
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: (trainController
                                                                  .trainLiveStatusModel
                                                                  .value
                                                                  .data
                                                                  ?.lateUpdate)??false
                                                              ? Colors.red
                                                              : Colors.green),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  width: 10,
                                                  height: 80,
                                                  color: Colors.blue[100],
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(trainController
                                                            .trainLiveStatusModel
                                                            .value
                                                            .data
                                                            ?.currentStationName
                                                            .toString() ??
                                                        ""),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text((trainController
                                                                    .trainLiveStatusModel
                                                                    .value
                                                                    .data
                                                                    ?.distanceFromSource)
                                                                .toString() +
                                                            " km"),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        const Text("platform"),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal: 5),
                                                          color: Colors.white,
                                                          child: Text(trainController
                                                                  .trainLiveStatusModel
                                                                  .value
                                                                  .data
                                                                  ?.platformNumber
                                                                  .toString() ??
                                                              ""),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                const Spacer(),
                                                Column(
                                                  children: [
                                                    Text(trainController
                                                            .trainLiveStatusModel
                                                            .value
                                                            .data
                                                            ?.curStnSta
                                                            .toString() ??
                                                        ""),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      trainController
                                                              .trainLiveStatusModel
                                                              .value
                                                              .data
                                                              ?.etd
                                                              .toString() ??
                                                          "",
                                                      style: TextStyle(
                                                          color: (trainController
                                                                  .trainLiveStatusModel
                                                                  .value
                                                                  .data
                                                                  ?.lateUpdate)??false
                                                              ? Colors.red
                                                              : Colors.green),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            left: 50,
                                            child: Image.asset(
                                              "assets/icons/train_location_icon.png",
                                              scale: 12,
                                            ),
                                          )
                                        ])
                                      :
    
                                      // building upcoming station data
                                      Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Text(trainController
                                                          .trainLiveStatusModel
                                                          .value
                                                          .data
                                                          ?.upcomingStations![
                                                              bIndex]
                                                          .sta
                                                          .toString() ??
                                                      ''),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    trainController
                                                            .trainLiveStatusModel
                                                            .value
                                                            .data
                                                            ?.upcomingStations![
                                                                bIndex]
                                                            .eta
                                                            .toString() ??
                                                        "",
                                                    style: TextStyle(
                                                        color: (trainController
                                                                    .trainLiveStatusModel
                                                                    .value
                                                                    .data
                                                                    ?.upcomingStations![
                                                                        bIndex]
                                                                    .arrivalDelay)! >
                                                                0
                                                            ? Colors.red
                                                            : Colors.green),
                                                  )
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
                                                    radius: 3,
                                                    backgroundColor: Colors.blue),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(trainController
                                                          .trainLiveStatusModel
                                                          .value
                                                          .data
                                                          ?.upcomingStations![
                                                              bIndex]
                                                          .stationName
                                                          .toString() ??
                                                      ""),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text((trainController
                                                                  .trainLiveStatusModel
                                                                  .value
                                                                  .data
                                                                  ?.upcomingStations![
                                                                      bIndex]
                                                                  .distanceFromSource)
                                                              .toString() +
                                                          " km"),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      const Text("platform"),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Container(
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 5),
                                                        color: Colors.white,
                                                        child: Text(trainController
                                                                .trainLiveStatusModel
                                                                .value
                                                                .data
                                                                ?.upcomingStations!
                                                                    [bIndex]
                                                                .platformNumber
                                                                .toString() ??
                                                            ""),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              const Spacer(),
                                              Column(
                                                children: [
                                                  Text(trainController
                                                          .trainLiveStatusModel
                                                          .value
                                                          .data
                                                          ?.upcomingStations![
                                                              bIndex]
                                                          .std
                                                          .toString() ??
                                                      ""),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    trainController
                                                            .trainLiveStatusModel
                                                            .value
                                                            .data
                                                            ?.upcomingStations![
                                                                bIndex]
                                                            .etd
                                                            .toString() ??
                                                        "",
                                                    style: TextStyle(
                                                        color: (trainController
                                                                    .trainLiveStatusModel
                                                                    .value
                                                                    .data
                                                                    ?.upcomingStations![
                                                                        bIndex]
                                                                    .arrivalDelay)! >
                                                                0
                                                            ? Colors.red
                                                            : Colors.green),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                        },
                      ),
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10),
          color: const Color(0xffE2AAF9),
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                trainController.trainLiveStatusModel.value.data
                        ?.currentLocationInfo![0].readableMessage
                        .toString() ??
                    "",
                style: const TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w500),
              ),
              CupertinoButton(
                onPressed: () {
                  _scrollToIndex(trainController.trainLiveStatusModel.value.data!.previousStations!.length);
                },
                minSize: 0,
                padding: EdgeInsets.zero,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: AppConstants.primaryColor,
                  child: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
