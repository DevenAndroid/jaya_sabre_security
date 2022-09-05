class ModelRegisterStepOne {
  ModelRegisterStepOne({
    required this.status,
    required this.message,
    required this.data,
  });
  late final bool status;
  late final String message;
  Data? data;

  ModelRegisterStepOne.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = json['data']==null?null:Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data!.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.userId,
  });
  late final int userId;

  Data.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    return _data;
  }
}