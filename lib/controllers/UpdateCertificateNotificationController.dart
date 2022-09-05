import 'package:get/get.dart';

import '../models/ModelSaveCeriticateNotification.dart';
import '../repository/get_save_certificate_notification_repository.dart';

class SaveCertificateNotification extends GetxController {
  Rx<ModelSaveCeriticateNotification> model =
      ModelSaveCeriticateNotification().obs;
  RxBool isDataLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() {
    saveCertificateNotification('id').then((value) {
      print(' Save Certificate Notification ');
      isDataLoading.value = true;
      model.value = value;
      return null;
    });
  }
}
