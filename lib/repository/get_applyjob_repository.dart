import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabre_security_app/models/ModelHomeData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../helper.dart';
import '../models/ModelLogIn.dart';
import '../router/my_router/my_router.dart';
import '../utils/ApiConstant.dart';

Future<ModelHomeData> getAppliedJob(context, jobID) async {
  var map = <String, dynamic>{};
  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelLogIn? user = ModelLogIn.fromJson(jsonDecode(pref.getString('user')!));

  var headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: "Bearer ${user.user!.token}"
  };

  map['job_id'] = jobID;
  map['user_id'] = user.user!.id.toString();
  print(map.toString());

  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);

  final response = await http.post(Uri.parse(ApiUrls.applyJob),
      body: jsonEncode(map), headers: headers);
  log('DATA FROM SERVER' + response.body.toString());
  if (response.statusCode == 200) {
    if (ModelHomeData.fromJson(jsonDecode(response.body)).message ==
        "User not Found") {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.clear();
      showToast("User not Found");
      Get.offAllNamed(MyRouter.loginScreen);
      //  }
    }
    Helpers.hideLoader(loader);
    return ModelHomeData.fromJson(json.decode(response.body));
  } else {
    // Helper.createSnackBar( response.statusCode.toString());
    Helpers.hideLoader(loader);
    throw Exception(response.body);
  }
}
