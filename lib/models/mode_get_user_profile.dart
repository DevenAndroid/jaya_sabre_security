class ModelGetUserProfile {
  bool? status;
  String? message;
  Data? data;

  ModelGetUserProfile({this.status, this.message, this.data});

  ModelGetUserProfile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? userid;
  String? name;
  String? designation;
  String? email;
  String? phone;
  String? dob;
  String? profileImage;
  String? address;

  Data(
      {this.userid,
        this.name,
        this.email,
        this.phone,
        this.dob,
        this.designation,
        this.profileImage,
        this.address});

  Data.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    name = json['name'];
    designation = json['designation'];
    email = json['email'];
    phone = json['phone'];
    dob = json['dob'];
    profileImage = json['profile_image'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userid'] = userid;
    data['name'] = name;
    data['designation'] = designation;
    data['email'] = email;
    data['phone'] = phone;
    data['dob'] = dob;
    data['profile_image'] = profileImage;
    data['address'] = address;
    return data;
  }
}
