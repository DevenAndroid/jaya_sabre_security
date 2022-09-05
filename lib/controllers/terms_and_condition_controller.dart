import 'dart:convert';

import 'package:get/get.dart';
import 'package:sabre_security_app/models/ModelTermsAndPolicy.dart';

import '../repository/get_Terms_and_policy_repository.dart';

class TermsAndConditionsController extends GetxController {
  Rx<ModelTermsAndPolicy> model1 = ModelTermsAndPolicy().obs;
  RxBool dataLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() {
    termsandconditions('Term-and-condition').then((value) {
      print("notification is working  ${jsonEncode(value)}");
      model1.value = value;
      dataLoaded.value = true;
    });
  }
}
