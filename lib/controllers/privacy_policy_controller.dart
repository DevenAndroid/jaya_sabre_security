import 'dart:convert';

import 'package:get/get.dart';

import '../models/ModelPrivacyPolicy.dart';
import '../repository/get_privacy_policy_repository.dart';

class PrivacyPolicyController extends GetxController {
  Rx<ModelprivacyPolicy> model = ModelprivacyPolicy().obs;
  RxBool dataLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() {
    privacyPolicy('privacy-policy').then((value) {
      print("notification is working  ${jsonEncode(value)}");
      model.value = value;
      dataLoaded.value = true;
    });
  }
}
