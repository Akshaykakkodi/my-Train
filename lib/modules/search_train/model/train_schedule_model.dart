import 'package:json_annotation/json_annotation.dart';

part 'train_schedule_model.g.dart';

@JsonSerializable()
class TrainScheduleModel {
   bool status;
    String message;
    int timestamp;
    Data data;

    TrainScheduleModel({
        required this.status,
        required this.message,
        required this.timestamp,
        required this.data,
    });
    factory TrainScheduleModel.fromJson(Map<String, dynamic> json) => _$TrainScheduleModelFromJson(json);
    Map<String, dynamic> toJson() => _$TrainScheduleModelToJson(this);
}

@JsonSerializable()
class Data {
       String trainType;
    String trainNumber;
    String trainName;
    RunDays runDays;
    // List<Class> dataClass;
    // List<Class> quota;
    List<Route> route;

    Data({
        required this.trainType,
        required this.trainNumber,
        required this.trainName,
        required this.runDays,
        // required this.dataClass,
        // required this.quota,
        required this.route,
    });

     factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
    Map<String, dynamic> toJson() => _$DataToJson(this);

}

@JsonSerializable()



@JsonSerializable()
class Route {
    int? today_sta;
    int sta;
    String? train_src;
    bool stop;
    int? std_min;
    String? station_name;
    String? station_code;
    String? state_name;
    String? state_code;
    int? staMin;
    int? radius;
    int? platform_number;
    int? on_time_rating;
    String? lng;
    String? lat;
    bool? is_smart_station;
    int? fog_incidence_probability;
    String? distance_from_source;
    int? day;
    int? dDay;

    Route({
        required this.today_sta,
        required this.sta,
        required this.train_src,
        required this.stop,
        required this.std_min,
        required this.station_name,
        required this.station_code,
        required this.state_name,
        required this.state_code,
        required this.staMin,
        required this.radius,
        required this.platform_number,
        required this.on_time_rating,
        required this.lng,
        required this.lat,
        required this.is_smart_station,
        required this.fog_incidence_probability,
        required this.distance_from_source,
        required this.day,
        required this.dDay,
    });

     factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);
    Map<String, dynamic> toJson() => _$RouteToJson(this);

}






@JsonSerializable()
class RunDays {
    bool sun;
    bool mon;
    bool tue;
    bool wed;
    bool thu;
    bool fri;
    bool sat;

    RunDays({
        required this.sun,
        required this.mon,
        required this.tue,
        required this.wed,
        required this.thu,
        required this.fri,
        required this.sat,
    });

     factory RunDays.fromJson(Map<String, dynamic> json) => _$RunDaysFromJson(json);
    Map<String, dynamic> toJson() => _$RunDaysToJson(this);

}
