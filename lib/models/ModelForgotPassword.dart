class ModelForgotPassword {
  bool? status;
  String? message;
  Data? data;

  ModelForgotPassword({this.status, this.message, this.data});

  ModelForgotPassword.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  int? otp;

  Data({this.userId, this.otp});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['otp'] = this.otp;
    return data;
  }
}
