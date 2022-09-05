import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sabre_security_app/models/ModelSaveCeriticateNotification.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/ModelLogIn.dart';
import '../utils/ApiConstant.dart';

Future<ModelSaveCeriticateNotification> saveCertificateNotification(
  cate_id,
) async {
  Map<String, dynamic> map = {};
  map["cate_id"] = cate_id;

  print("VALUES" + map.toString());

  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelLogIn? user = ModelLogIn.fromJson(jsonDecode(pref.getString('user')!));

  var headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: "Bearer ${user.user!.token}"
  };
  final response = await http.post(
      Uri.parse(ApiUrls.saveCertificateNotification),
      headers: headers,
      body: jsonEncode(map));

  if (response.statusCode == 200) {
    //Helper.hideLoader(loader);
    return ModelSaveCeriticateNotification.fromJson(json.decode(response.body));
  } else {
    // Helper.createSnackBar( response.statusCode.toString());
    // Helper.hideLoader(loader);
    throw Exception(response.body);
  }
}
