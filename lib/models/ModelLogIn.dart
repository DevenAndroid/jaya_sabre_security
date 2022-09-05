class ModelLogIn {
  bool? status;
  String? message;
  User? user;

  ModelLogIn({this.status, this.message, this.user});

  ModelLogIn.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? dob;
  String? gender;
  String? phone;
  Null? emailVerifiedAt;
  int? isOtpVerified;
  Null? userStatus;
  String? profileImage;
  String? city;
  String? state;
  String? address;
  String? zip;
  String? discription;
  String? createdAt;
  String? updatedAt;
  String? token;

  User(
      {this.id,
        this.name,
        this.firstName,
        this.lastName,
        this.email,
        this.dob,
        this.gender,
        this.phone,
        this.emailVerifiedAt,
        this.isOtpVerified,
        this.userStatus,
        this.profileImage,
        this.city,
        this.state,
        this.address,
        this.zip,
        this.discription,
        this.createdAt,
        this.updatedAt,
        this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    dob = json['dob'];
    gender = json['gender'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    isOtpVerified = json['is_otp_verified'];
    userStatus = json['user_status'];
    profileImage = json['profile_image'];
    city = json['city'];
    state = json['state'];
    address = json['address'];
    zip = json['zip'];
    discription = json['discription'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['is_otp_verified'] = this.isOtpVerified;
    data['user_status'] = this.userStatus;
    data['profile_image'] = this.profileImage;
    data['city'] = this.city;
    data['state'] = this.state;
    data['address'] = this.address;
    data['zip'] = this.zip;
    data['discription'] = this.discription;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['token'] = this.token;
    return data;
  }
}
