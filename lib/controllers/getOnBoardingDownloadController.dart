import 'package:get/get.dart';
import '../models/ModelOnBoardingDownloading.dart';
import '../repository/get_onboardingDownloding_repository.dart';

class GetOnboardingDownloadController extends GetxController {
  Rx<ModelOnBoardingDownload> model = ModelOnBoardingDownload().obs;
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
    getonboardingDownloadingData().then((value) {
      print('onboarding API ');
      isDataLoading.value = true;
      model.value = value;
      return null;
    });
  }

  getData() {
    getonboardingDownloadingData().then((value) {
      print('DATA FROM SERVER::' + value.toString());
      isDataLoading.value = true;
      model.value = value;
      return null;
    });
  }
}
