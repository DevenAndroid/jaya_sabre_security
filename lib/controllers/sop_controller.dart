
import 'dart:convert';
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:sabre_security_app/models/ModelSop.dart';

import '../repository/sop_repository.dart';

class SopController extends GetxController{
  Rx<ModelSop> sopModel = ModelSop().obs;
  RxBool dataLoaded = false.obs;


  @override
  void onInit(){
    super.onInit();

    sopRepo().then((value){
      print("Sop page"+ jsonEncode(value));
      sopModel.value = value;
      dataLoaded.value = true;
    });
  }

}