import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sabre_security_app/models/ModelCertificateNotification.dart';
import 'package:sabre_security_app/models/ModelLogIn.dart';
import 'package:sabre_security_app/utils/ApiConstant.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ModelCertificateNotification> certificateNotificationRepo() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelLogIn? user = ModelLogIn.fromJson(jsonDecode(pref.getString('user')!));

  var headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: "Bearer ${user.user!.token}"
  };

  final response = await http.post(Uri.parse(ApiUrls.certificateNotification),
      headers: headers);

  print('SERVE RESPONSE' + response.body.toString());
  if (response.statusCode == 200) {
    return ModelCertificateNotification.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
