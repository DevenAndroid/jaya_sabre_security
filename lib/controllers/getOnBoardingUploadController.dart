// import 'package:get/get.dart';
// import '../models/ModelHomeData.dart';
// import '../models/ModelOnBoardingDownloading.dart';
// import '../repository/get_home_repository.dart';
// import '../repository/get_onboardingDownloding_repository.dart';
// import '../repository/get_onboardingUpload_repository.dart';
//
// class GetOnboardingDownloadController extends GetxController {
//
//   Rx<ModelOnBoardingDownload> model = ModelOnBoardingDownload().obs;
//   RxBool isDataLoading = false.obs;
//   // RxBool categoryProductsLoading = false.obs;
//   // final currentIndex = 0.obs;
//   // final currentIndex1 = 0.obs;
//   // final productQuantity = 1.obs;
//   // increment() {
//   //   productQuantity.value++;
//   // }
//
//
//   @override
//   void onInit() {
//     super.onInit( );
//     postApiCallMultipart().then((value) {
//       print('HOME SCREEB API ');
//       isDataLoading.value = true;
//       model.value = value;
//       return null;
//     });
//   }
//
//   getData(){
//     postApiCallMultipart().then((value) {
//       isDataLoading.value = true;
//       model.value = value;
//       return null;
//     });
//   }
//
// }