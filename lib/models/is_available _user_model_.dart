import 'package:get/get.dart';

class IsAvailableUserModel {
  bool? status;
  String? message;
  Data? data;

  IsAvailableUserModel({this.status, this.message, this.data});

  IsAvailableUserModel.fromJson(Map<String, dynamic> json) {
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
  RxString? isAvailable = "0".obs;

  Data({this.isAvailable});

  Data.fromJson(Map<String, dynamic> json) {
    isAvailable!.value = json['is_available'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_available'] = this.isAvailable.toString();
    return data;
  }
}
