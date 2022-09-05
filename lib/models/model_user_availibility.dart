class ModelUserAvailability {
  bool? status;
  String? message;
  Data? data;

  ModelUserAvailability({this.status, this.message, this.data});

  ModelUserAvailability.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<WeekData>? weekData;

  Data({this.weekData});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['week_data'] != null) {
      weekData = <WeekData>[];
      json['week_data'].forEach((v) {
        weekData!.add(new WeekData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.weekData != null) {
      data['week_data'] = this.weekData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WeekData {
  String? day;
  String? startTime;
  String? endTime;

  WeekData({this.day, this.startTime, this.endTime});

  WeekData.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}
