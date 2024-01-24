import 'dart:convert';

TrainLiveStatusModel trainLiveStatusModelFromJson(String str) => TrainLiveStatusModel.fromJson(json.decode(str));



class TrainLiveStatusModel {
    bool? status;
    String? message;
    num? timestamp;
    Datas? data;

    TrainLiveStatusModel({
        this.status,
        this.message,
        this.timestamp,
        this.data,
    });

    factory TrainLiveStatusModel.fromJson(Map<String, dynamic> json) => TrainLiveStatusModel(
        // status: json["status"],
        // message: json["message"],
        // timestamp: json["timestamp"],
        data: json["data"] == null ? null : Datas.fromJson(json["data"]),
    );

   
}

class Datas {
    num? distanceFromSource;
    num? userId;
    bool? atSrcDstn;
    bool? atDstn;
    String? trainName;
    bool? isRyEta;
    String? curStnStd;
    String? std;
    List<PreviousStation>? previousStations;
    num? instanceAlert;
    bool? success;
    List<UpcomingStation>? upcomingStations;
    double? spentTime;
    num? aDay;
    String? aheadDistanceText;
    String? curStnSta;
    String? destination;
    DateTime? notificationDate;
    bool? atSrc;
    String? currentStationCode;
    bool? lateUpdate;
    num? avgSpeed;
    String? currentStationName;
    String? irTrainName;
    String? etd;
    DateTime? trainStartDate;
    num? stoppageNumber;
    String? dataFrom;
    num? journeyTime;
    num? delay;
    num? totalDistance;
    num? statusAsOfMin;
    num? siNo;
    String? seoTrainName;
    String? eta;
    num? aheadDistance;
    String? source;
    String? statusAsOf;
    List<CurrentLocationInfo>? currentLocationInfo;
    bool? isRunDay;
    num? relatedAlert;
    String? runDays;
    String? status;
    String? trainNumber;
    String? newAlertMsg;
    dynamic smartCityId;
    num? newAlertId;
    
    DateTime? updateTime;
    num? platformNumber;

    Datas({
        this.distanceFromSource,
        this.userId,
        this.atSrcDstn,
        this.atDstn,
        this.trainName,
        this.isRyEta,
        this.curStnStd,
        this.std,
        this.previousStations,
        this.instanceAlert,
        this.success,
        this.upcomingStations,
        this.spentTime,
        this.aDay,
        this.aheadDistanceText,
        this.curStnSta,
        this.destination,
        this.notificationDate,
        this.atSrc,
        this.currentStationCode,
        this.lateUpdate,
        this.avgSpeed,
        this.currentStationName,
        this.irTrainName,
        this.etd,
        this.trainStartDate,
        this.stoppageNumber,
        this.dataFrom,
        this.journeyTime,
        this.delay,
        this.totalDistance,
        this.statusAsOfMin,
        this.siNo,
        this.seoTrainName,
        this.eta,
        this.aheadDistance,
        this.source,
        this.statusAsOf,
        this.currentLocationInfo,
        this.isRunDay,
        this.relatedAlert,
        this.runDays,
        this.status,
        this.trainNumber,
        this.newAlertMsg,
        this.smartCityId,
        this.newAlertId,
        
        this.updateTime,
        this.platformNumber,
    });

    factory Datas.fromJson(Map<String, dynamic> json) => Datas(
        distanceFromSource: json["distance_from_source"],
        // userId: json["user_id"],
        // atSrcDstn: json["at_src_dstn"],
        // atDstn: json["at_dstn"],
        trainName: json["train_name"],
        // isRyEta: json["is_ry_eta"],
        curStnStd: json["cur_stn_std"],
        std: json["std"],
        previousStations: json["previous_stations"] == null ? [] : List<PreviousStation>.from(json["previous_stations"]!.map((x) => PreviousStation.fromJson(x))),
        instanceAlert: json["instance_alert"],
        // success: json["success"],
        upcomingStations: json["upcoming_stations"] == null ? [] : List<UpcomingStation>.from(json["upcoming_stations"]!.map((x) => UpcomingStation.fromJson(x))),
        // spentTime: json["spent_time"]?.toDouble(),
        aDay: json["a_day"],
        aheadDistanceText: json["ahead_distance_text"],
        curStnSta: json["cur_stn_sta"],
        destination: json["destination"],
        // notificationDate: json["notification_date"] == null ? null : DateTime.parse(json["notification_date"]),
        // atSrc: json["at_src"],
        // currentStationCode: json["current_station_code"],
        lateUpdate: json["late_update"],
        // avgSpeed: json["avg_speed"],
        currentStationName: json["current_station_name"],
        irTrainName: json["ir_train_name"],
        etd: json["etd"],
        trainStartDate: json["train_start_date"] == null ? null : DateTime.parse(json["train_start_date"]),
        // stoppageNumber: json["stoppage_number"],
        // dataFrom: json["data_from"],
        // journeyTime: json["journey_time"],
        delay: json["delay"],
        // totalDistance: json["total_distance"],
        // statusAsOfMin: json["status_as_of_min"],
        // siNo: json["si_no"],
        // seoTrainName: json["seo_train_name"],
        eta: json["eta"],
        aheadDistance: json["ahead_distance"],
        source: json["source"],
        // statusAsOf: json["status_as_of"],
        currentLocationInfo: json["current_location_info"] == null ? [] : List<CurrentLocationInfo>.from(json["current_location_info"]!.map((x) => CurrentLocationInfo.fromJson(x))),
        isRunDay: json["is_run_day"],
        relatedAlert: json["related_alert"],
        runDays: json["run_days"],
        // status: json["status"],
        trainNumber: json["train_number"],
        newAlertMsg: json["new_alert_msg"],
        // smartCityId: json["smart_city_id"],
        // newAlertId: json["new_alert_id"],
        // currentStateCode: stateCodeValues.map[json["current_state_code"]]!,
        // updateTime: json["update_time"] == null ? null : DateTime.parse(json["update_time"]),
        platformNumber: json["platform_number"],
    );

    
}

class CurrentLocationInfo {
    num? type;
    String? readableMessage;
    String? message;
    String? label;
    String? imgUrl;
    String? hint;
    String? deeplink;

    CurrentLocationInfo({
        this.type,
        this.readableMessage,
        this.message,
        this.label,
        this.imgUrl,
        this.hint,
        this.deeplink,
    });

    factory CurrentLocationInfo.fromJson(Map<String, dynamic> json) => CurrentLocationInfo(
        // type: json["type"],
        readableMessage: json["readable_message"],
        message: json["message"],
        // label: json["label"],
        // imgUrl: json["img_url"],
        // hint: json["hint"],
        // deeplink: json["deeplink"],
    );

}





class PreviousStation {
    num? stoppageNumber;
    String? std;
    String? stationName;
    double? stationLng;
    double? stationLat;
    String? stationCode;
   
    String? sta;
    dynamic smartCityId;
    num? siNo;
    num? platformNumber;
    List<NonStop>? nonStops;
    num? halt;
    String? etd;
    String? eta;
    num? distanceFromSource;
    num? arrivalDelay;
    num? aDay;

    PreviousStation({
        this.stoppageNumber,
        this.std,
        this.stationName,
        this.stationLng,
        this.stationLat,
        this.stationCode,
        
        this.sta,
        this.smartCityId,
        this.siNo,
        this.platformNumber,
        this.nonStops,
        this.halt,
        this.etd,
        this.eta,
        this.distanceFromSource,
        this.arrivalDelay,
        this.aDay,
    });

    factory PreviousStation.fromJson(Map<String, dynamic> json) => PreviousStation(
        // stoppageNumber: json["stoppage_number"],
        std: json["std"],
        stationName: json["station_name"],
        // stationLng: json["station_lng"]?.toDouble(),
        // stationLat: json["station_lat"]?.toDouble(),
        // stationCode: json["station_code"],
        
        sta: json["sta"],
        // smartCityId: json["smart_city_id"],
        // siNo: json["si_no"],
        platformNumber: json["platform_number"],
        // nonStops: json["non_stops"] == null ? [] : List<NonStop>.from(json["non_stops"]!.map((x) => NonStop.fromJson(x))),
        // halt: json["halt"],
        etd: json["etd"],
        eta: json["eta"],
        distanceFromSource: json["distance_from_source"],
        arrivalDelay: json["arrival_delay"],
        aDay: json["a_day"],
    );


}

class NonStop {
    String? std;
    String? stationName;
    String? stationCode;
    
    String? sta;
    num? siNo;
    num? distanceFromSource;

    NonStop({
        this.std,
        this.stationName,
        this.stationCode,
       
        this.sta,
        this.siNo,
        this.distanceFromSource,
    });

    factory NonStop.fromJson(Map<String, dynamic> json) => NonStop(
        std: json["std"],
        stationName: json["station_name"],
        // stationCode: json["station_code"],
       
        sta: json["sta"],
        // siNo: json["si_no"],
        distanceFromSource: json["distance_from_source"],
    );

  
}

class UpcomingStation {
    String? stationName;
    double? stationLng;
    double? stationLat;
    String? stationCode;
   
    String? sta;
    num? siNo;
    num? platformNumber;
    num? onTimeRating;
    List<NonStop>? nonStops;
    num? halt;
    String? etd;
    String? eta;
    num? distanceFromSource;
    String? distanceFromCurrentStationTxt;
    num? distanceFromCurrentStation;
    num? arrivalDelay;
    num? aDay;
    num? stoppageNumber;
    String? std;
    dynamic smartCityId;
    bool? foodAvailable;
    num? etaAMin;
    num? day;

    UpcomingStation({
        this.stationName,
        this.stationLng,
        this.stationLat,
        this.stationCode,
        
        this.sta,
        this.siNo,
        this.platformNumber,
        this.onTimeRating,
        this.nonStops,
        this.halt,
        this.etd,
        this.eta,
        this.distanceFromSource,
        this.distanceFromCurrentStationTxt,
        this.distanceFromCurrentStation,
        this.arrivalDelay,
        this.aDay,
        this.stoppageNumber,
        this.std,
        this.smartCityId,
        this.foodAvailable,
        this.etaAMin,
        this.day,
    });

    factory UpcomingStation.fromJson(Map<String, dynamic> json) => UpcomingStation(
        stationName: json["station_name"],
        // stationLng: json["station_lng"]?.toDouble(),
        // stationLat: json["station_lat"]?.toDouble(),
        // stationCode: json["station_code"],
        
        sta: json["sta"],
        // siNo: json["si_no"],
        platformNumber: json["platform_number"],
        // onTimeRating: json["on_time_rating"],
        // nonStops: json["non_stops"] == null ? [] : List<NonStop>.from(json["non_stops"]!.map((x) => NonStop.fromJson(x))),
        // halt: json["halt"],
        etd: json["etd"],
        eta: json["eta"],
        distanceFromSource: json["distance_from_source"],
        distanceFromCurrentStationTxt: json["distance_from_current_station_txt"],
        distanceFromCurrentStation: json["distance_from_current_station"],
        arrivalDelay: json["arrival_delay"],
        aDay: json["a_day"],
        // stoppageNumber: json["stoppage_number"],
        std: json["std"],
        // smartCityId: json["smart_city_id"],
        // foodAvailable: json["food_available"],
        etaAMin: json["eta_a_min"],
        day: json["day"],
    );

   
}








