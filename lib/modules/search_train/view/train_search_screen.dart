import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mytrain/constants/app_constants.dart';
import 'package:mytrain/modules/search_train/controller/train_controller.dart';
import 'package:mytrain/modules/search_train/view/train_details_screen.dart';

class TrainSearchScreen extends StatefulWidget {
  const TrainSearchScreen({super.key});

  @override
  State<TrainSearchScreen> createState() => _TrainSearchScreenState();
}

class _TrainSearchScreenState extends State<TrainSearchScreen> {
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
            
            controller: trainNumberCntrl,
            validator: (value) {
              if(value!.isEmpty){
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
                      trainController.searchTrain(int.parse(trainNumberCntrl.text));
                    }
                    
                  },
                  child: const Icon(Icons.search_outlined)),
                constraints: const BoxConstraints(maxHeight: 40),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          ),
        ),
      ),
      body: Obx(
        () => 
         Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
           
          child:trainController.trainSearchModel.value.data.isEmpty?Lottie.asset("assets/icons/search.json",):
          trainController.isSearchingTrain.value==true? Center(child: CircularProgressIndicator()):
           ListView.builder(
            itemCount: trainController.trainSearchModel.value.data.length,
            itemBuilder: (context, index) {
              print("inside builder");
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to( TrainDetailsScreen(trainNumber: trainController.trainSearchModel.value.data[index].trainNumber,));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.all(5),
                                color: AppConstants.primaryColor,
                                child: Text(
                                  trainController.trainSearchModel.value.data[index].trainNumber,
                                  style:const TextStyle(color: Colors.white),
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                trainController.trainSearchModel.value.data[index].engTrainName,
                                style:const TextStyle(fontSize: 13),
                              ),
                            )
                          ],
                        ),
                        Image.asset(
                          "assets/icons/train2.png",
                          scale: 5,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
