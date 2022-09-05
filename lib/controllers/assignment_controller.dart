import 'dart:convert';

import 'package:get/get.dart';
import 'package:sabre_security_app/models/model_assignment.dart';

import '../repository/assignment_repository.dart';

class AssignmentController extends GetxController {
  Rx<ModelAssignment> model = ModelAssignment().obs;
  RxBool dataLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() {
    print("Start");
    getAssignment().then((value) {
      print(":::::::::::::::::" + jsonEncode(value));
      dataLoaded.value = true;
      model.value = value;
      print(model.value.toString() + "is checked checking");
    });
  }
}
