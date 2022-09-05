import 'dart:convert';
import 'dart:io';
import 'package:sabre_security_app/models/ModelAddUser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/ModelLogIn.dart';
import '../models/ModelOnBoardingDownloading.dart';
import '../models/ModelOnBoardingUpload.dart';
import '../utils/ApiConstant.dart';

Future<ModelOnBoardingDownload> getonboardingDownloadingData() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelLogIn? user = ModelLogIn.fromJson(jsonDecode(pref.getString('user')!));

  var headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: "Bearer ${user.user!.token}"
  };

  final response = await http.post(Uri.parse(ApiUrls.onboardingDownloadingUrl),
      headers: headers);
  print("DATA FROM SERVER::00" + response.body.toString());
  if (response.statusCode == 200) {
    //Helper.hideLoader(loader);
    return ModelOnBoardingDownload.fromJson(json.decode(response.body));
  } else {
    // Helper.createSnackBar( response.statusCode.toString());
    // Helper.hideLoader(loader);
    throw Exception(response.body);
  }
}
