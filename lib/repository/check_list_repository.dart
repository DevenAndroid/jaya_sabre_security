import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sabre_security_app/models/ModelCheckList.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/ModelLogIn.dart';
import '../utils/ApiConstant.dart';

Future<ModelCheckList> checkListRepo(id) async {
  var map = <String, dynamic>{};

  map['job_id'] = id;

  print('DATA::' + map.toString());
  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelLogIn? user = ModelLogIn.fromJson(jsonDecode(pref.getString('user')!));

  var headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: "Bearer ${user.user!.token}"
  };

  final response = await http.post(Uri.parse(ApiUrls.checkList),
      body: jsonEncode(map), headers: headers);
  print('DATA RESPONSE ::::' + response.body.toString());
  if (response.statusCode == 200) {
    return ModelCheckList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}
