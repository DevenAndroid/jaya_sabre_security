import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:sabre_security_app/models/model_common_response.dart';
import 'package:sabre_security_app/utils/ApiConstant.dart';

Future<ModelCommonResponse> postApiCallMultipart(
  Map<String, String> jsonData,
  String? fieldName1,
  String? fieldName2,
  String? fieldName3,
  String? fieldName4,
  String? fieldName5,
  String? fieldName6,
  String? fieldName7,
  String? fieldName8,
  String? fieldName9,
  File file1,
  file2,
  file3,
  file4,
  file5,
  file6,
  file7,
  file8,
  file9,
) async {
  var request =
      http.MultipartRequest('POST', Uri.parse(ApiUrls.registerStepTwo));
  request.fields.addAll(jsonData);

  request.files.add(await multipartFile(fieldName1, file1));

  file2 != ""
      ? request.files.add(await multipartFile(fieldName2, file2))
      : null;

  file3 != " "
      ? request.files.add(await multipartFile(fieldName3, file3))
      : null;

  file4 != " "
      ? request.files.add(await multipartFile(fieldName4, file4))
      : null;

  file5 != " "
      ? request.files.add(await multipartFile(fieldName5, file5))
      : null;

  file6 != " "
      ? request.files.add(await multipartFile(fieldName6, file6))
      : null;

  file7 != " "
      ? request.files.add(await multipartFile(fieldName7, file7))
      : null;

  file8 != " "
      ? request.files.add(await multipartFile(fieldName8, file8))
      : null;

  file9 != " "
      ? request.files.add(await multipartFile(fieldName9, file9))
      : null;

  if (kDebugMode) log('Api Post, url ${ApiUrls.registerStepTwo}');
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
