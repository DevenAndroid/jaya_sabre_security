import 'dart:convert';
import 'dart:io';
import 'package:sabre_security_app/models/ModelAddUser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/ModelLogIn.dart';
import '../utils/ApiConstant.dart';

Future<ModelAddUser> getAddUser(jobId,title,image) async {
  var map = <String, dynamic>{};
  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelLogIn? user = ModelLogIn.fromJson(jsonDecode(pref.getString('user')!));

  var headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: "Bearer ${user.user!.token}"
  };

  map['job_id'] = jobId;
  map['title'] = title;
  map['image'] = image;

  final response = await http.post(Uri.parse(ApiUrls.addExpenses),
      body: jsonEncode(map),
      headers: headers);

  if (response.statusCode == 200) {
    //Helper.hideLoader(loader);
    return ModelAddUser.fromJson(json.decode(response.body));
  } else {
    // Helper.createSnackBar( response.statusCode.toString());
    // Helper.hideLoader(loader);
    throw Exception(response.body);
  }
}