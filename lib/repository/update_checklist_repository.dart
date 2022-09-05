import 'dart:convert';
import 'dart:io';
import 'package:sabre_security_app/models/ModelAddUser.dart';
import 'package:sabre_security_app/models/model_assignment.dart';
import 'package:sabre_security_app/models/model_common_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/ModelLogIn.dart';
import '../utils/ApiConstant.dart';

Future<ModelCommonResponse> updateCheckListRepo(job_id, arrive_on_site,
    document_mileage, call_local, arriveTime, distance, exitTime) async {
  Map<String, dynamic> map = {};
  map["job_id"] = job_id;
  map["arrive_on_site"] = arrive_on_site;
  map["document_mileage"] = document_mileage;
  map["call_local"] = call_local;
  map["arriveTime"] = arriveTime;
  map["distance"] = distance == "Not Applicable" ? "0" : distance;
  map["exitTime"] = exitTime;

  print(map.toString() + "Map response form update check list");
  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelLogIn? user = ModelLogIn.fromJson(jsonDecode(pref.getString('user')!));

  var headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: "Bearer ${user.user!.token}"
  };
  final response = await http.post(Uri.parse(ApiUrls.updateCheckList),
      headers: headers, body: jsonEncode(map));

  if (response.statusCode == 200) {
    print(response.body.toString() + "resopnse ");
    //Helper.hideLoader(loader);
    return ModelCommonResponse.fromJson(json.decode(response.body));
  } else {
    // Helper.createSnackBar( response.statusCode.toString());
    // Helper.hideLoader(loader);
    throw Exception(response.body);
  }
}
