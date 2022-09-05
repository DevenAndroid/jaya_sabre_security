import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sabre_security_app/utils/ApiConstant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/ModelLogIn.dart';
import '../models/model_common_response.dart';

Future<ModelCommonResponse> editProfileMuiltipart(
  Map<String, String> jsonData,
  String? fieldName1,
  file1,
) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelLogIn? user = ModelLogIn.fromJson(jsonDecode(pref.getString('user')!));

  Map<String, String> getApiHeaders(String? authToken) {
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'accept': 'text/plain',
      'Authorization': 'Bearer $authToken',
    };
  }

  var request = http.MultipartRequest(
    'POST',
    Uri.parse(ApiUrls.updateUserProfile),
  );
  request.headers.addAll(getApiHeaders(user.user!.token));
  request.fields.addAll(jsonData);

  // request.files.add(await multipartFile(fieldName1, file1));

  file1 != ""
      ? request.files.add(await multipartFile(fieldName1, file1))
      : null;

  // if (kDebugMode) log('Api Post, url ${ApiUrls.registerStepTwo}');
  if (kDebugMode) log('Api request- ${jsonEncode(jsonData)}');
  if (kDebugMode) log('Api header- ${request.headers}');
  final response = await request.send();
  var value1;
  await response.stream.transform(utf8.decoder).listen((value) {
    value1 = value;
    print(value1);
  });
  return ModelCommonResponse.fromJson(jsonDecode(value1.toString()));
}

Future<http.MultipartFile> multipartFile(String? fieldName, File file1) async {
  return http.MultipartFile(
    fieldName ?? 'file',
    http.ByteStream(Stream.castFrom(file1.openRead())),
    await file1.length(),
    filename: file1.path.split('/').last,
  );
}
