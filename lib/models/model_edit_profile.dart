class ModelUpdateUserProfile {
  bool? status;
  String? message;
  Data? data;

  ModelUpdateUserProfile({this.status, this.message, this.data});

  ModelUpdateUserProfile.fromJson(Map<String, dynamic> json) {
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
  String? email;
  String? phone;
  String? address;
  String? dob;
  String? profileImage;

  Data({this.email, this.phone, this.address, this.dob, this.profileImage});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    dob = json['dob'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['dob'] = this.dob;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
