import 'package:get/get.dart';
import '../models/ModelHomeData.dart';
import '../repository/get_home_repository.dart';

class GetHomeController extends GetxController {
  Rx<ModelHomeData> model = ModelHomeData().obs;
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
    // getHomeData().then((value) {
    //   print('HOME SCREEB API ');
    //   isDataLoading.value = true;
    //   model.value = value;
    // });
  }

  getData() {
    getHomeData().then((value) {
      if (value.status == true) {
        isDataLoading.value = true;
        model.value = value;
      }
    });
  }
}
