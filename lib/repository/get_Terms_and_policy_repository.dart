import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sabre_security_app/models/ModelTermsAndPolicy.dart';

import '../utils/ApiConstant.dart';

Future<ModelTermsAndPolicy> termsandconditions(slug) async {
  var map = <String, dynamic>{};
  map['slug'] = slug;

  print(map);

  var headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };

  final response = await http.post(Uri.parse(ApiUrls.pages),
      body: jsonEncode(map), headers: headers);
  if (response.statusCode == 200) {
    return ModelTermsAndPolicy.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}
