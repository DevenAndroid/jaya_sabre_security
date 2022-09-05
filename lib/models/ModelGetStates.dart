class ModelGetStates {
  ModelGetStates({
    this.status,
    this.message,
    this.data,
  });
  bool? status;
  String? message;
  List<ModelStateData>? data;

  ModelGetStates.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>ModelStateData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ModelStateData {
  ModelStateData({
    required this.id,
    required this.name,
  });
  dynamic id;
  dynamic name;

  ModelStateData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}