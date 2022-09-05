import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sabre_security_app/models/model_common_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/ModelLogIn.dart';
import '../utils/ApiConstant.dart';

Future<ModelCommonResponse> deleteUploadCertificate(context, fileName) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var map = <String, dynamic>{};
  ModelLogIn? user = ModelLogIn.fromJson(jsonDecode(pref.getString('user')!));

  var headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: "Bearer ${user.user!.token}"
  };

  map['file_name'] = fileName;

  final response = await http.post(Uri.parse(ApiUrls.deleteuploadfile),
      body: jsonEncode(map), headers: headers);

  if (response.statusCode == 200) {
    //Helper.hideLoader(loader);
    return ModelCommonResponse.fromJson(json.decode(response.body));
  } else {
    // Helper.createSnackBar( response.statusCode.toString());
    // Helper.hideLoader(loader);
    throw Exception(response.body);
  }
}
