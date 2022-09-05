import 'package:get/get.dart';
import 'package:sabre_security_app/models/ModelAddUser.dart';
import '../models/ModelHomeData.dart';
import '../repository/get_addUser_repository.dart';
import '../repository/get_home_repository.dart';

class GetAddUser extends GetxController {

  Rx<ModelAddUser> model = ModelAddUser().obs;
  RxBool isDataLoading = false.obs;


  @override
  void onInit() {
    super.onInit( );
    getData();

  }

  getData(){
    getAddUser("",'','').then((value) {
      isDataLoading.value = true;
      model.value = value;
      return null;
    });
  }

}