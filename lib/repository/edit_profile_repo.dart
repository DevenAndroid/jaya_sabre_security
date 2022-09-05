import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/ModelLogIn.dart';
import '../models/model_edit_profile.dart';
import '../router/my_router/my_router.dart';
import '../utils/ApiConstant.dart';

Future<ModelUpdateUserProfile> updateProfileFieldData(BuildContext context,
    emailAddress, phoneNumber, address, dateOfBirth, profile) async {
  var map = <String, dynamic>{};
  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelLogIn? user = ModelLogIn.fromJson(jsonDecode(pref.getString('user')!));

  var headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: "Bearer ${user.user!.token}"
  };

  map['email'] = emailAddress;
  map['phone'] = phoneNumber;
  map['address'] = address;
  map['dob'] = dateOfBirth;
  if (profile != '') {
    map['profile'] = profile;
  }
  http.Response response = await http.post(Uri.parse(ApiUrls.updateUserProfile),
      body: jsonEncode(map), headers: headers);

  if (response.statusCode == 200) {
    if (ModelUpdateUserProfile.fromJson(jsonDecode(response.body)).message ==
        "User not Found") {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.clear();
      showToast("User not Found");
      Get.offAllNamed(MyRouter.loginScreen);
      //  }
    }
    log("DEBUG PROFILE RESPONSE :: ${response.body}");
    return ModelUpdateUserProfile.fromJson(json.decode(response.body));
  } else {
    print("error occurred");
    throw Exception(response.body);
  }
}
