import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repository/forgot_password_repository.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController email = TextEditingController();

  RxBool isDataLoading = false.obs;

  bool step1 = false;
  bool step2 = false;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() {
    forgotpassword('', email).then((value) {
      isDataLoading.value = true;
      return null;
    });
  }
}
