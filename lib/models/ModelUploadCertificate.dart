class ModelUplaodCertificate {
  bool? status;
  String? message;
  List<Data>? data;

  ModelUplaodCertificate({this.status, this.message, this.data});

  ModelUplaodCertificate.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? fileName;
  String? url;

  Data({this.fileName, this.url});

  Data.fromJson(Map<String, dynamic> json) {
    fileName = json['file_name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file_name'] = this.fileName;
    data['url'] = this.url;
    return data;
  }
}
