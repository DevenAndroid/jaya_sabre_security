import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sabre_security_app/models/ModelSop.dart';
import '../utils/ApiConstant.dart';



Future<ModelSop> sopRepo() async {

  final response = await http.get(
    Uri.parse(ApiUrls.sop),
  );

  if (response.statusCode == 200) {
    return ModelSop.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}