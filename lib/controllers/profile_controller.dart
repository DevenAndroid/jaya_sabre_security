import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/mode_get_user_profile.dart';
import '../repository/get_user_profile_repo.dart';

class ProfileController extends GetxController {
  Rx<ModelGetUserProfile> model = ModelGetUserProfile().obs;
  RxBool isDataLoading = false.obs;
  File? image;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController dobController1 = TextEditingController();
  String profileTime = "";

  String? fName;
  var index;
  RxBool isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() {
    getUserProfile().then((value) {
      if (value.status == true || model.value.data!.name != null) {
        model.value = value;
        isDataLoading.value = true;
        emailController.text = model.value.data!.email!;
        phoneController.text = model.value.data!.phone!.toString();
        addressController.text = model.value.data!.address!.toString();
        dobController.text = model.value.data!.dob!.toString();
        dobController1.text = model.value.data!.dob!.toString();
        profileTime = model.value.data!.dob!.toString();
      }
    });
  }
}
