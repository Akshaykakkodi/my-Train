import 'dart:convert';

TrainSearchModel trainSearchModelFromJson(String str) => TrainSearchModel.fromJson(json.decode(str));

String trainSearchModelToJson(TrainSearchModel data) => json.encode(data.toJson());

class TrainSearchModel {
    bool status;
    String message;
    int timestamp;
    List<Datum> data;

    TrainSearchModel({
        required this.status,
        required this.message,
        required this.timestamp,
        required this.data,
    });

    factory TrainSearchModel.fromJson(Map<String, dynamic> json) => TrainSearchModel(
        status: json["status"],
        message: json["message"],
        timestamp: json["timestamp"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "timestamp": timestamp,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String trainNumber;
    String trainName;
    String engTrainName;
    String newTrainNumber;

    Datum({
        required this.trainNumber,
        required this.trainName,
        required this.engTrainName,
        required this.newTrainNumber,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        trainNumber: json["train_number"],
        trainName: json["train_name"],
        engTrainName: json["eng_train_name"],
        newTrainNumber: json["new_train_number"],
    );

    Map<String, dynamic> toJson() => {
        "train_number": trainNumber,
        "train_name": trainName,
        "eng_train_name": engTrainName,
        "new_train_number": newTrainNumber,
    };
}
