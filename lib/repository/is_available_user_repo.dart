import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/is_available _user_model_.dart';
import '../utils/ApiConstant1.dart';

Future<IsAvailableUserModel> isAvailableUser() async {
  var map = <String, dynamic>{};
   SharedPreferences pref = await SharedPreferences.getInstance();
  var token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyMiIsImp0aSI6IjM4NTNhM2JmNGE1MjljNzlkODVhZDUxNjM3YWE5OTQwMzMxNTdlYmIxOTliNzJkOTcwOGU5MThiYWEzZWNjZGVmZmFmYjg5OTc2MTA2YmQ3IiwiaWF0IjoxNjU3NzkyNDU5LjE2ODAxOSwibmJmIjoxNjU3NzkyNDU5LjE2ODAyLCJleHAiOjE2ODkzMjg0NTkuMTY2MzU2LCJzdWIiOiI0ODkiLCJzY29wZXMiOltdfQ.j_q7rvRlG5bNs70FlzS1kjwC3NtXv0z0qTfINWt0hr1s4mNeBQurnu2YIxfytyXFVSCbE8rGu-JUU_oEW65Z5UYRE4X8mW3huwoerlkA1yfzO8RsxMABvnGTyE07pkIn7ef456nQt5KI5x4Od9TgQ4qIuPJxkKr8KO4CPHIc954JIsW6001qoflpRR4liP6aNCYui3XRDci1h7TSZpwA3y5LXiTT7N9lJ2v5pFdHZzQ0OMLCIqsmOnN2cvaLjN_NSZN4TWlNAoLEY3CH8w4ps6wbLt9usIqmNavTZXh9XjGDzUH4dzbyjuVJ-E-kC_OQoI7mKDcyzfmRwaU-sw3xLhVB7vNw1OxHgXsy8uUOjVziYUr3fRikpjHubJQy6UTdHZRNftLdizhYUfsQupekNPiXROQFXqi5IX03P4rsPFtOr74UeUizoUTsJXsLlJ_VrFNOe9vRDKvtJt5mvpnC3tjF3ol4u6z49E0ijx9GF7lgrvo5I0GtjNpGqueijSB8rGFKCUDVrP2qgH9mOkQxu04KJhh-b-zITYoqEy5BXBx2c1Ju_vgDt8Atb6ifS9MR8V2Fq3IWmFR2SuMhKBC2xueC9OgN6fkUQ96hecK-77RB3gSUcIBUnpxLsJmZ5rjRaLVLdRdM0h_LEqLtvT1mEnKILsVyYMHnmiCoZxqY8jo';
  if (pref.getString('user') != null) {
    // ModelLogIn? user = ModelLogIn.fromJson(jsonDecode(pref.getString('user')!));
    // token = user.token;
  }
  http.Response response = await http.post(Uri.parse(ApiUrls1.isAvailableUser),
      body:jsonEncode (map),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: "Bearer $token"
      });
  print("Server Response" + response.body  );

  if (response.statusCode == 200) {
    return IsAvailableUserModel.fromJson(json.decode(response.body));
  } else {
    print("access not found for get user repository");
    throw Exception(response.body);
  }
}
