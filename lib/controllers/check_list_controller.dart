import 'dart:convert';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sabre_security_app/models/ModelCheckList.dart';

import '../repository/check_list_repository.dart';

class CheckListController extends GetxController {
  Rx<ModelCheckList> checkListModel = ModelCheckList().obs;
  var outputFormat = DateFormat('hh:mm a'); //Example: 14:18
  RxBool dataLoaded = false.obs;
  String arriveTime = "";
  String distance = "";
  String exitTime = "";

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  var dropDownValue1;

  var value;
  getData() {
    checkListRepo(Get.arguments[0]).then((value) {
      checkListModel.value = value;
      if (value.data!.distance.toString() == "0") {
        dropDownValue1 = "Not Applicable";
      } else if (value.data!.distance.toString() != "") {
        dropDownValue1 = value.data!.distance.toString();
      }
      // if(checkListModel.value.data!.distance.toString() == ""){}
      // value =  ?  : "";
      dataLoaded.value = true;
      if (checkListModel.value.data!.arriveTime.toString() != "") {
        arriveTime = outputFormat.format(
            DateTime.parse(checkListModel.value.data!.arriveTime.toString()));
      }
      distance = checkListModel.value.data!.distance.toString();
      if (checkListModel.value.data!.exitTime.toString() != "") {
        exitTime = outputFormat.format(
            DateTime.parse(checkListModel.value.data!.exitTime.toString()));
      }
    });
  }
}
