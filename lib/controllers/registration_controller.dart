import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/ModelGetStates.dart';
import '../repository/get_states_list_repository.dart';

class RegistrationController extends GetxController {
  late TabController tabController;
  TextEditingController fullName1 = TextEditingController();
  TextEditingController email1 = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController phone1 = TextEditingController();
  TextEditingController dateInput1 = TextEditingController();
  TextEditingController drivingDate = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController city1 = TextEditingController();
  TextEditingController zipCode1 = TextEditingController();
  Rx<ModelGetStates> stateDataModel = ModelGetStates().obs;
  RxBool isDataLoading = false.obs;

  bool step1 = false;
  bool step2 = false;

  @override
  void onInit() {
    super.onInit();
    getStateData();
  }

  getStateData() {
    getStateList().then((value) {
      isDataLoading.value = true;
      stateDataModel.value = value;
      return null;
    });
  }
}
