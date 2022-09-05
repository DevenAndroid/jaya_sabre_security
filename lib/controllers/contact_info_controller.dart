import 'dart:convert';
import 'package:get/get.dart';
import 'package:sabre_security_app/repository/contact_info_repository.dart';
import '../models/ModelContactInfo.dart';

class ContactInfoController extends GetxController{
  Rx<ModelContactInfo> contactInfoModel = ModelContactInfo().obs;
  RxBool dataLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();

    contactInfoRepo().then((value) {
      print('Contact Information'+jsonEncode(value));
      contactInfoModel.value = value;
      dataLoaded.value = true;
    });
  }

}