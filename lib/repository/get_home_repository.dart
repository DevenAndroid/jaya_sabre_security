import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:sabre_security_app/models/ModelHomeData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/ModelLogIn.dart';
import '../router/my_router/my_router.dart';
import '../utils/ApiConstant.dart';

Future<ModelHomeData> getHomeData() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ModelLogIn? user = ModelLogIn.fromJson(jsonDecode(pref.getString('user')!));

  var headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: "Bearer ${user.user!.token}"
  };
  final response =
      await http.post(Uri.parse(ApiUrls.homeUrl), headers: headers);

  if (response.statusCode == 200) {
    //Helper.hideLoader(loader);
    if (ModelHomeData.fromJson(jsonDecode(response.body)).message ==
        "User not Found") {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.clear();
      showToast("User not Found");
      Get.offAllNamed(MyRouter.loginScreen);
      //  }
    }
    return ModelHomeData.fromJson(json.decode(response.body));
  } else {
    // Helper.createSnackBar( response.statusCode.toString());
    // Helper.hideLoader(loader);
    throw Exception(response.body);
  }
}
