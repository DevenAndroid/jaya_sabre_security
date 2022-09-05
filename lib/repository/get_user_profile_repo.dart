import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../helper.dart';
import '../models/ModelLogIn.dart';
import '../models/mode_get_user_profile.dart';

import '../router/my_router/my_router.dart';
import '../utils/ApiConstant.dart';

Future<ModelGetUserProfile> getUserProfile() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelLogIn? user = ModelLogIn.fromJson(jsonDecode(pref.getString('user')!));

  var headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: "Bearer ${user.user!.token}"
  };
  http.Response response =
      await http.post(Uri.parse(ApiUrls.getUserProfile), headers: headers);
  print("${response.body} response form get user data repository");

  if (response.statusCode == 200) {
    if (ModelGetUserProfile.fromJson(jsonDecode(response.body)).message ==
        "User not Found") {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.clear();
      showToast("User not Found");
      Get.offAllNamed(MyRouter.loginScreen);
      //  }
    }
    return ModelGetUserProfile.fromJson(json.decode(response.body));
  } else {
    print("access not found for get user repotsitory");
    throw Exception(response.body);
  }
}
