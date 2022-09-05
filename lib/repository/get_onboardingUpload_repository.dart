import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:sabre_security_app/utils/ApiConstant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/ModelLogIn.dart';
import '../models/ModelOnBoardingUpload.dart';

Future<ModelOnBoardingUpload> postApiCallMultipart(
  Map<String, String> jsonData,
  String? fieldName1,
  File file1,
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
    Uri.parse(ApiUrls.addExpenses),
  );
  request.headers.addAll(getApiHeaders(user.user!.token));
  request.fields.addAll(jsonData);
  request.files.add(await multipartFile(fieldName1, file1));
  // if (kDebugMode) log('Api Post, url ${ApiUrls.registerStepTwo}');
  if (kDebugMode) log('Api request- ${jsonEncode(jsonData)}');
  if (kDebugMode) log('Api header- ${request.headers}');
  final response = await request.send();
  var value1;
  await response.stream.transform(utf8.decoder).listen((value) {
    value1 = value;
    print(value1);
  });
  return ModelOnBoardingUpload.fromJson(jsonDecode(value1.toString()));
}

Future<http.MultipartFile> multipartFile(String? fieldName, File file1) async {
  return http.MultipartFile(
    fieldName ?? 'file',
    http.ByteStream(Stream.castFrom(file1.openRead())),
    await file1.length(),
    filename: file1.path.split('/').last,
  );
}

Future<ModelOnBoardingUpload> postApiCallMultipart1(
  String? fieldName1,
  File file1,
) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelLogIn? user = ModelLogIn.fromJson(jsonDecode(pref.getString('user')!));
  Map<String, String> getApiHeaders(String? authToken) {
    if (kDebugMode) log('Api authToken-> $authToken');
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'accept': 'text/plain',
      'Authorization': 'Bearer $authToken',
    };
  }

  var request = http.MultipartRequest(
    'POST',
    Uri.parse(ApiUrls.onboardingUploadUrl),
  );
  request.headers.addAll(getApiHeaders(user.user!.token));
  // request.fields.addAll(jsonData);
  request.files.add(await multipartFile1(fieldName1, file1));
  // if (kDebugMode) log('Api Post, url ${ApiUrls.registerStepTwo}');
  // if (kDebugMode) log('Api request- ${jsonEncode(jsonData)}');
  if (kDebugMode) log('Api header- ${request.headers}');
  final response = await request.send();
  var value1;
  await response.stream.transform(utf8.decoder).listen((value) {
    value1 = value;
    print(value1);
  });
  return ModelOnBoardingUpload.fromJson(jsonDecode(value1.toString()));
}

Future<http.MultipartFile> multipartFile1(String? fieldName, File file1) async {
  return http.MultipartFile(
    fieldName ?? 'file',
    http.ByteStream(Stream.castFrom(file1.openRead())),
    await file1.length(),
    filename: file1.path.split('/').last,
  );
}
