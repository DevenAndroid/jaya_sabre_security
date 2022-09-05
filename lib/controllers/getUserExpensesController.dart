import 'package:get/get.dart';
import 'package:sabre_security_app/models/ModelUserExpenses.dart';

import '../repository/get_user_expenses_repository.dart';

class GetUserExpenses extends GetxController {
  Rx<ModelUserExpenses> model = ModelUserExpenses().obs;
  RxBool isDataLoading = false.obs;
  // RxBool categoryProductsLoading = false.obs;
  // final currentIndex = 0.obs;
  // final currentIndex1 = 0.obs;
  // final productQuantity = 1.obs;
  // increment() {
  //   productQuantity.value++;
  // }

  @override
  void onInit() {
    super.onInit();
    getData();
    // getUserExpenses().then((value) {
    //   print('HOME SCREEB API ');
    //   isDataLoading.value = true;
    //   model.value = value;
    //   return null;
    // });
  }

  getData() {
    getUserExpenses().then((value) {
      isDataLoading.value = true;
      model.value = value;
      return null;
    });
  }
}
