// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'train_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainScheduleModel _$TrainScheduleModelFromJson(Map<String, dynamic> json) =>
    TrainScheduleModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      timestamp: json['timestamp'] as int,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrainScheduleModelToJson(TrainScheduleModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'timestamp': instance.timestamp,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      trainType: json['trainType'] as String,
      trainNumber: json['trainNumber'] as String,
      trainName: json['trainName'] as String,
      runDays: RunDays.fromJson(json['runDays'] as Map<String, dynamic>),
      route: (json['route'] as List<dynamic>)
          .map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'trainType': instance.trainType,
      'trainNumber': instance.trainNumber,
      'trainName': instance.trainName,
      'runDays': instance.runDays,
      'route': instance.route,
    };

Route _$RouteFromJson(Map<String, dynamic> json) => Route(
      today_sta: json['today_sta'] as int?,
      sta: json['sta'] as int,
      train_src: json['train_src'] as String?,
      stop: json['stop'] as bool,
      std_min: json['std_min'] as int?,
      station_name: json['station_name'] as String?,
      station_code: json['station_code'] as String?,
      state_name: json['state_name'] as String?,
      state_code: json['state_code'] as String?,
      staMin: json['staMin'] as int?,
      radius: json['radius'] as int?,
      platform_number: json['platform_number'] as int?,
      on_time_rating: json['on_time_rating'] as int?,
      lng: json['lng'] as String?,
      lat: json['lat'] as String?,
      is_smart_station: json['is_smart_station'] as bool?,
      fog_incidence_probability: json['fog_incidence_probability'] as int?,
      distance_from_source: json['distance_from_source'] as String?,
      day: json['day'] as int?,
      dDay: json['dDay'] as int?,
    );

Map<String, dynamic> _$RouteToJson(Route instance) => <String, dynamic>{
      'today_sta': instance.today_sta,
      'sta': instance.sta,
      'train_src': instance.train_src,
      'stop': instance.stop,
      'std_min': instance.std_min,
      'station_name': instance.station_name,
      'station_code': instance.station_code,
      'state_name': instance.state_name,
      'state_code': instance.state_code,
      'staMin': instance.staMin,
      'radius': instance.radius,
      'platform_number': instance.platform_number,
      'on_time_rating': instance.on_time_rating,
      'lng': instance.lng,
      'lat': instance.lat,
      'is_smart_station': instance.is_smart_station,
      'fog_incidence_probability': instance.fog_incidence_probability,
      'distance_from_source': instance.distance_from_source,
      'day': instance.day,
      'dDay': instance.dDay,
    };

RunDays _$RunDaysFromJson(Map<String, dynamic> json) => RunDays(
      sun: json['sun'] as bool,
      mon: json['mon'] as bool,
      tue: json['tue'] as bool,
      wed: json['wed'] as bool,
      thu: json['thu'] as bool,
      fri: json['fri'] as bool,
      sat: json['sat'] as bool,
    );

Map<String, dynamic> _$RunDaysToJson(RunDays instance) => <String, dynamic>{
      'sun': instance.sun,
      'mon': instance.mon,
      'tue': instance.tue,
      'wed': instance.wed,
      'thu': instance.thu,
      'fri': instance.fri,
      'sat': instance.sat,
    };
