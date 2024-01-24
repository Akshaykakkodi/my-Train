

import 'dart:convert';

StationModel stationModelFromJson(String str) => StationModel.fromJson(json.decode(str));

String stationModelToJson(StationModel data) => json.encode(data.toJson());

class StationModel {
    bool? status;
    String? message;
    int? timestamp;
    List<Datum>? data;

    StationModel({
        this.status,
        this.message,
        this.timestamp,
        this.data,
    });

    factory StationModel.fromJson(Map<String, dynamic> json) => StationModel(
        status: json["status"],
        message: json["message"],
        timestamp: json["timestamp"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "timestamp": timestamp,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? name;
    String? engName;
    String? code;
    String? stateName;

    Datum({
        this.name,
        this.engName,
        this.code,
        this.stateName,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        engName: json["eng_name"],
        code: json["code"],
        stateName: json["state_name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "eng_name": engName,
        "code": code,
        "state_name": stateName,
    };
}
