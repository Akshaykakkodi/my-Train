import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytrain/constants/app_constants.dart';
import 'package:mytrain/modules/search_station/controller/station_controller.dart';
import 'package:mytrain/modules/search_station/view/search_station_screen.dart';
import 'package:mytrain/modules/search_station/view/search_train_from_station_screen.dart';
import 'package:mytrain/modules/search_train/view/search_train_live_screen.dart';
import 'package:mytrain/modules/search_train/view/train_search_screen.dart';

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 

  @override
  Widget build(BuildContext context) {
    StationController stationController=Get.put(StationController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF1DBD8),
      appBar: AppBar(
        backgroundColor: AppConstants.primaryColor,
        centerTitle: true,
        title:const Hero(
          tag: "title",
          child:  Text(
            "My Train",
            style: TextStyle(fontSize: 26, color: Colors.white),
          ),
        ),
      ),
      body: Obx(
        () => 
         Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding:const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                    border: Border.all(color: const Color(0xffDCD6D5)),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(children: [
                        Row(
                          children: [
                          
                         const Icon(Icons.trip_origin),
                           const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TextFormField(
                               controller: stationController.fromStationCntrl.value,
                                decoration:const InputDecoration(
                                  hintText: "From",
      
                                  constraints: BoxConstraints(),
                                 
                                ),
                              ),
                            ),
                          ],
                        ),
                      const  SizedBox(
                          height: 20,
                        ),
                       CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          stationController.invertControllers();
                        },
                         child:  CircleAvatar(
                              radius: 25,
                              backgroundColor: AppConstants.primaryColor,
                              child:const Icon(
                                Icons.swap_vert,
                                color: Colors.white,
                              )),
                       ),
                        Row(
                          children: [
                           const Icon(Icons.trip_origin),
                     
                           const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller:stationController.toStationCntrl.value ,
                                
                                decoration:const InputDecoration(
                                  
                                  hintText: "To",
                                  constraints: BoxConstraints(),
                                 
                                ),
                              ),
                            ),
                          ],
                        ),
                      const  SizedBox(height: 20,),
      
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          minSize: 0,
                          onPressed: () {
                            
                            Get.to(const SearchTrainFromStationScreen());
                          },
                          child: Container(
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppConstants.primaryColor
                            ),
                            child:const Center(child: Text("Find Trains",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            ),)),
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              TextFormField(
                onTap: () {
                  Get.to(const TrainSearchScreen());
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  constraints: const BoxConstraints(maxHeight: 55),
                  hintText: "Train No.",
                  prefixIcon: const Icon(Icons.train),
                  suffixIcon: const Icon(Icons.search_outlined),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xffDCD6D5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppConstants.primaryColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onTap: () {
                  Get.to(const SearchStationScreen());
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  constraints: const BoxConstraints(maxHeight: 55),
                  hintText: "search station",
                  prefixIcon: const Icon(Icons.directions_railway_outlined),
                  suffixIcon: const Icon(Icons.search_outlined),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xffDCD6D5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppConstants.primaryColor),
                  ),
                ),
              ),
      
             const SizedBox(height: 20,),
      
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(const SearchLiveTrainScreen());          
                      },
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppConstants.primaryColor,
                        ),
                        
                        child: Row(
                          children: [
                            Image.asset("assets/icons/train_location_icon.png",scale: 10,),
                           const Text("Track Train",style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                  ),
      
                const  SizedBox(width: 15,),
      
                  Expanded(
                    child: Container(
                      padding:const EdgeInsets.all(10),
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppConstants.primaryColor,
                        ),
                      
                     
                      child:const Row(
                        
                        children: [
                          Icon(Icons.search_outlined,color: Colors.white,),
                          SizedBox(width: 15,),
                          Text("Check PNR\n status",textAlign: TextAlign.center,style: TextStyle(
                            color: Colors.white,
                          ),)
                        ],
                      )
                      ),
                    ),
                  
      
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
