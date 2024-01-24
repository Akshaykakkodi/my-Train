import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytrain/constants/app_constants.dart';
import 'package:mytrain/modules/search_train/controller/train_controller.dart';

class SearchTrainFromStationScreen extends StatelessWidget {
  const SearchTrainFromStationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TrainController trainController = Get.find();
    return Obx(
      () => 
       Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstants.primaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            GestureDetector(
              onTap: () {
                trainController.pickDate(context);
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffCE82EE)),
                child: Row(
                  children: [
                    Text(
                      trainController.date.value.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 50,
              color: AppConstants.primaryColor,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ALP",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.arrow_forward_sharp,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("CLT", style: TextStyle(color: Colors.white, fontSize: 20))
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                color: AppConstants.primaryColor,
                                child: Center(
                                    child: Text(
                                  "16660",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text("6:18 AM"),
                              const SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.arrow_forward_sharp),
                              const SizedBox(
                                width: 10,
                              ),
                              Text("12:50 PM"),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Amritsar weekly Express",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text("Runs Daily")
                            ],
                          )
                        ],
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
