import 'package:get/get.dart';

import '../models/is_available _user_model_.dart';
import '../repository/is_available_user_repo.dart';

class IsAvailabilityController extends GetxController {
  Rx<IsAvailableUserModel> model = IsAvailableUserModel().obs;
  RxBool isDataLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() {
    isAvailableUser().then((value) {
      model.value = value;
      isDataLoading.value = true;
    });
  }
}
