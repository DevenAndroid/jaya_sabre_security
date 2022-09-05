import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/ModelRegisterStepOne.dart';
import '../utils/ApiConstant.dart';

Future<ModelRegisterStepOne> getpersonalInfo(
    name,email,password, phone, date , address , city , state ,zip , gender ,BuildContext context) async {
  var map = <String, dynamic>{};
  SharedPreferences pref = await SharedPreferences.getInstance();
  // pref.getString('fcmToken');
  map['name'] = name;
  map['email'] = email;
  map['password'] = password;
  map['phone'] = phone;
  map['dob'] = date;
  map['address'] = address;
  map['city'] = city;
  map['state'] = state;
  map['zip'] = zip;
  map['gender'] = gender;


  print("registration Details"+map.toString());

  // OverlayEntry loader = Helper.overlayLoader(context);
  // Overlay.of(context)!.insert(loader);

  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };

  http.Response response = await http.post(Uri.parse(ApiUrls.registerStepOne),
      body: jsonEncode(map), headers: headers);

  print('SERVER DATA REQUEST Registration::' +jsonEncode(map));
  print('SERVER DATA RESPONSE Registration::' +response.body.toString());

  if (response.statusCode == 200) {
    //Helper.hideLoader(loader);
    return ModelRegisterStepOne.fromJson(json.decode(response.body));
  } else {
    // Helper.createSnackBar( response.statusCode.toString());
    // Helper.hideLoader(loader);
    throw Exception(response.body);
  }
}