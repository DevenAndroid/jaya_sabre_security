import 'dart:convert';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../models/model_user_availibility.dart';
import '../repository/user-availability_repo.dart';

class AvailabilityController extends GetxController {
  Rx<ModelUserAvailability> model = ModelUserAvailability().obs;
  RxBool isDataLoading = false.obs;
  TextEditingController daysController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  RxBool isChecked = false.obs;

  String? fName;
  var index;
  RxBool isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() {
    userAvailability().then((value) {
      if (value.status == true) {
        log("jsonEncode(value)");
        log(jsonEncode(value));
        model.value = value;
        isDataLoading.value = true;
      }
    });
  }
}
