import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sabre_security_app/models/ModelUploadCertificate.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/ModelLogIn.dart';
import '../router/my_router/my_router.dart';
import '../utils/ApiConstant.dart';

Future<ModelUplaodCertificate> getUplodedCertificate() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelLogIn? user = ModelLogIn.fromJson(jsonDecode(pref.getString('user')!));

  var headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: "Bearer ${user.user!.token}"
  };
  final response = await http.post(Uri.parse(ApiUrls.showUploadCertificateUrl),
      headers: headers);

  print(
      'DATA FROM SERVER getUplodedCertificate:::::' + response.body.toString());

  if (response.statusCode == 200) {
    if (ModelUplaodCertificate.fromJson(jsonDecode(response.body)).message ==
        "User not Found") {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.clear();
      showToast("User not Found");
      Get.offAllNamed(MyRouter.loginScreen);
      //  }
    }
    //Helper.hideLoader(loader);
    return ModelUplaodCertificate.fromJson(json.decode(response.body));
  } else {
    // Helper.createSnackBar( response.statusCode.toString());
    // Helper.hideLoader(loader);
    throw Exception(response.body);
  }
}
