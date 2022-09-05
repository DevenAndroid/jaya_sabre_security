import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../helper.dart';
import '../models/ModelLogIn.dart';
import '../utils/ApiConstant.dart';

Future<ModelLogIn> createLogin(String username, String password,
    String fcmToken, BuildContext context) async {
  var map = <String, dynamic>{};
  SharedPreferences pref = await SharedPreferences.getInstance();
  // pref.getString('fcmToken');

  map['email'] = username;
  map['password'] = password;
  map['fcm_token'] = fcmToken;
  // map['device_id'] = pref.getString('deviceId');

  print("Login Details" + map.toString());

  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);

  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };

  http.Response response = await http.post(Uri.parse(ApiUrls.loginUrl),
      body: jsonEncode(map), headers: headers);

  print('SERVER DATA REQUEST Login::' + jsonEncode(map));
  print('SERVER DATA RESPONSE Login::' + response.body.toString());

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    return ModelLogIn.fromJson(json.decode(response.body));
  } else {
    Helpers.hideLoader(loader);
    throw Exception(response.body);
  }
}
