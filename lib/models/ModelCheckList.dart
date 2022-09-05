class ModelCheckList {
  bool? status;
  String? message;
  Data? data;
  bool? checked;
  bool? done;

  ModelCheckList(
      {this.status, this.message, this.data, this.checked, this.done});

  ModelCheckList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    checked = json['checked'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['checked'] = this.checked;
    data['done'] = this.done;
    return data;
  }
}

class Data {
  bool? arriveOnSite;
  bool? documentMileage;
  bool? callLocal;
  String? arriveTime;
  dynamic distance;
  String? exitTime;

  Data(
      {this.arriveOnSite,
      this.documentMileage,
      this.callLocal,
      this.arriveTime,
      this.distance,
      this.exitTime});

  Data.fromJson(Map<String, dynamic> json) {
    arriveOnSite = json['arrive_on_site'];
    documentMileage = json['document_mileage'];
    callLocal = json['call_local'];
    arriveTime = json['arriveTime'];
    distance = json['distance'];
    exitTime = json['exitTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['arrive_on_site'] = this.arriveOnSite;
    data['document_mileage'] = this.documentMileage;
    data['call_local'] = this.callLocal;
    data['arriveTime'] = this.arriveTime;
    data['distance'] = this.distance;
    data['exitTime'] = this.exitTime;
    return data;
  }
}
