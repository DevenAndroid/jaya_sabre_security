import 'dart:convert';
import 'package:get/get.dart';
import '../models/ModelNotification.dart';
import '../repository/notification_repository.dart';

class NotificationController extends GetxController {
  Rx<ModelNotification> notificationModel = ModelNotification().obs;
  RxBool dataLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() {
    notificationRepo().then((value) {
      print("notification is working" + jsonEncode(value));
      notificationModel.value = value;
      dataLoaded.value = true;
    });
  }
}
