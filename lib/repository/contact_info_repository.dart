import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sabre_security_app/utils/ApiConstant.dart';
import '../models/ModelContactInfo.dart';

Future<ModelContactInfo> contactInfoRepo() async {
  // var map = <String, dynamic>{};
  // map['slug'] = slug;

  final response = await http.get(
    Uri.parse(ApiUrls.contactInfo),
    // body: map
  );

  if (response.statusCode == 200) {
    return ModelContactInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
