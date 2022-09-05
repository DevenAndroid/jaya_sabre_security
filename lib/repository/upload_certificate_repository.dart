import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sabre_security_app/models/model_common_response.dart';
import 'package:sabre_security_app/utils/ApiConstant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/ModelLogIn.dart';

Future<ModelCommonResponse> postApiCallMultipart2(
  Map<String, String> jsonData,
  String? fieldName1,
  String? fieldName2,
  String? fieldName3,
  String? fieldName4,
  file1,
  file2,
  file3,
  file4,
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

  var request =
      http.MultipartRequest('POST', Uri.parse(ApiUrls.uploadCertificateUrl));
  request.headers.addAll(getApiHeaders(user.user!.token));
  request.fields.addAll(jsonData);
  file1 != ""
      ? request.files.add(await multipartFile(fieldName1, file1))
      : null;
  file2 != ""
      ? request.files.add(await multipartFile(fieldName2, file2))
      : null;
  file3 != ""
      ? request.files.add(await multipartFile(fieldName3, file3))
      : null;
  file4 != ""
      ? request.files.add(await multipartFile(fieldName4, file4))
      : null;

  print("request.files.toString()");
  print(request.files[0].filename);

  if (kDebugMode) log('Api Post, url ${ApiUrls.uploadCertificateUrl}');
  if (kDebugMode) log('Api request- ${jsonEncode(jsonData)}');
  if (kDebugMode) log('Api header- ${request.headers}');

  log('DATA FROM SERVER::::0111111' + jsonEncode.toString());
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
