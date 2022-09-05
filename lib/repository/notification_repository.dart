import 'dart:convert';
import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/ModelLogIn.dart';
import '../models/ModelNotification.dart';
import '../utils/ApiConstant.dart';

Future<ModelNotification> notificationRepo() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelLogIn? user = ModelLogIn.fromJson(jsonDecode(pref.getString('user')!));

  var headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: "Bearer ${user.user!.token}"
  };
  final response =
      await http.post(Uri.parse(ApiUrls.notification), headers: headers);

  EasyLoading.show();
  if (response.statusCode == 200) {
    EasyLoading.dismiss();
    return ModelNotification.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
