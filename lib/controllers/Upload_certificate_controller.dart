import 'package:get/get.dart';
import 'package:sabre_security_app/models/ModelUploadCertificate.dart';

import '../repository/get_uploaded_certificate_repository.dart';

class GetUploadedCertificate extends GetxController {
  Rx<ModelUplaodCertificate> model = ModelUplaodCertificate().obs;
  RxBool isDataLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getUplodedCertificate().then((value) {
      print('upload certificate API ');
      isDataLoading.value = true;
      model.value = value;
      return null;
    });
  }

  getData() {
    getUplodedCertificate().then((value) {
      isDataLoading.value = true;
      model.value = value;
      return null;
    });
  }
}
