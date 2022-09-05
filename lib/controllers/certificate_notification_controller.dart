import 'dart:convert';

import 'package:get/get.dart';
import 'package:sabre_security_app/models/ModelCertificateNotification.dart';

import '../repository/certificate_notification_repository.dart';

class CertificateNotificationController extends GetxController {
  Rx<ModelCertificateNotification> certificateNotificationModel = ModelCertificateNotification().obs;
  RxBool dataLoad = false.obs;

  @override
  void onInit() {
    super.onInit();

    certificateNotificationRepo().then((value) {
      print('Certificate Notification' + jsonEncode(value));
      certificateNotificationModel.value = value;
      dataLoad.value = true;
    });
  }
}
