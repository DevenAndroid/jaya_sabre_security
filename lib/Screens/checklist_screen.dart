import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sabre_security_app/widgets/common_button.dart';

import '../controllers/assignment_controller.dart';
import '../controllers/check_list_controller.dart';
import '../repository/update_checklist_repository.dart';
import '../resources/theme/app_theme.dart';
import '../router/my_router/my_router.dart';
import '../utils/ApiConstant.dart';
import '../widgets/common_widget_button.dart';

class CheckListScreen extends StatefulWidget {
  const CheckListScreen({Key? key}) : super(key: key);

  @override
  State<CheckListScreen> createState() => _CheckListScreenState();
}

class _CheckListScreenState extends State<CheckListScreen> {
  CheckListController Controller = Get.put(CheckListController());
  AssignmentController controller = Get.put(AssignmentController());

  List<String> dropDownValue = [];

  var jobId;
  var selected = true;

  @override
  void initState() {
    super.initState();
    dropDownValue.clear();
    dropDownValue.add("Not Applicable");
    for (var i = 0; i < 501; i++) {
      int value = i + 1;
      dropDownValue.add(value.toString());
    }
    log(jsonEncode(dropDownValue));
    jobId = Get.arguments[0];
    Controller.getData();
    print('Data From asignment screen');
  }

  DateTime CurrentDate = DateTime.now();

  updateParameters() {
    var Output = DateFormat('yyyy-MM-dd kk:mm:ss');
    if (_formKey.currentState!.validate()) {}
    updateCheckListRepo(
      jobId,
      Controller.checkListModel.value.data!.arriveOnSite,
      Controller.checkListModel.value.data!.documentMileage,
      Controller.checkListModel.value.data!.callLocal,
      Output.format(DateTime.parse(
          Controller.checkListModel.value.data!.arriveTime.toString())),
      Controller.checkListModel.value.data!.distance,
      Controller.checkListModel.value.data!.callLocal == true
          ? Output.format(DateTime.parse(
              Controller.checkListModel.value.data!.exitTime.toString()))
          : "",
    ).then((value) {
      showToast1('Updated check list Data');
      if (value.status == true) {
        if (Controller.checkListModel.value.data!.arriveOnSite == true &&
            Controller.checkListModel.value.data!.documentMileage == true &&
            Controller.checkListModel.value.data!.callLocal == true) {
          Controller.checkListModel.value.checked = true;
          Get.back();
        } else {
          Controller.checkListModel.value.checked = false;
          Get.back();
        }
      }
    });
  }

  final _formKey = GlobalKey<FormState>();

  var selectedVal;

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width * 0.60;

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('hh.mm aa', 'en_US').format(now);
    print(" DATE Formate " + formattedDate);

    DateTime endTime = DateTime.now();
    String EndTime = DateFormat('hh.mm aa', 'en_US').format(endTime);
    print(" DATE Formate " + formattedDate);

    return Scaffold(
        appBar: CustomIcon('Check List', () {
          Get.back();
        }),
        body: Obx(() {
          return Controller.dataLoaded.value == false
              ? const Center(child: CircularProgressIndicator())
              : Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(MyRouter.bottomNavbarScreen);
                                    },
                                    child: const Text(
                                      "Skip",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: AppTheme.primaryColor,
                                          decorationStyle:
                                              TextDecorationStyle.solid,
                                          decorationThickness: 2,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              const Text(
                                'Residential Security Check List ',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 15),
                              // The checkboxes will be here
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 70,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              20,
                                          color: Colors.white,
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text('Arrived on Site'),
                                              Controller.checkListModel.value
                                                          .data!.arriveOnSite ==
                                                      true
                                                  ? Container(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0,
                                                          vertical: 8.0),
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xffF1F5FF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4)),
                                                      child: GestureDetector(
                                                        child: Text(
                                                          Controller
                                                              .outputFormat
                                                              .format(DateTime
                                                                  .parse(Controller
                                                                      .checkListModel
                                                                      .value
                                                                      .data!
                                                                      .arriveTime!)),
                                                          textAlign:
                                                              TextAlign.center,
                                                          textScaleFactor: 1.0,
                                                        ),
                                                      ),
                                                    )
                                                  : SizedBox.shrink(),
                                              Checkbox(
                                                activeColor:
                                                    const Color(0xFFffffff),
                                                checkColor:
                                                    const Color(0xff4169DD),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                side: MaterialStateBorderSide
                                                    .resolveWith(
                                                  (states) => const BorderSide(
                                                      width: 1.0,
                                                      color: Color(0xFF4169dd)),
                                                ),
                                                value: Controller.checkListModel
                                                    .value.data!.arriveOnSite,
                                                onChanged: (value) {
                                                  if (Controller
                                                          .checkListModel
                                                          .value
                                                          .data!
                                                          .arriveOnSite ==
                                                      false) {
                                                    Controller
                                                        .checkListModel
                                                        .value
                                                        .data!
                                                        .arriveOnSite = true;
                                                    Controller
                                                            .checkListModel
                                                            .value
                                                            .data!
                                                            .arriveTime =
                                                        DateTime.now()
                                                            .toString();
                                                    // Controller.arriveTime = Controller.outputFormat.format(DateTime.now());
                                                    // print("Date" +
                                                    //     Controller
                                                    //         .checkListModel
                                                    //         .value
                                                    //         .data!
                                                    //         .arriveTime
                                                    //         .toString());
                                                    // print("Date 1" +
                                                    //     Controller.arriveTime
                                                    //         .toString());
                                                    setState(() {});
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 15),
                                          height: 70,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: Colors.white,
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                  flex: 7,
                                                  child: Text(
                                                      'Document Mileage ')),
                                              Controller
                                                          .checkListModel
                                                          .value
                                                          .data!
                                                          .documentMileage ==
                                                      true
                                                  ? Expanded(
                                                      flex: 6,
                                                      child: DropdownButtonFormField<
                                                              String>(
                                                          validator: (value) {
                                                            if (value == null) {
                                                              return "Select value";
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color: Colors
                                                                  .black),
                                                          menuMaxHeight: 280,
                                                          isDense: true,
                                                          decoration:
                                                              InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "Distance",
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none),
                                                          items: List.generate(
                                                            dropDownValue
                                                                .length,
                                                            (index) =>
                                                                DropdownMenuItem(
                                                              value:
                                                                  dropDownValue[
                                                                      index],
                                                              child: Text(index ==
                                                                      0
                                                                  ? dropDownValue[
                                                                          index]
                                                                      .toString()
                                                                  : dropDownValue[
                                                                              index]
                                                                          .toString() +
                                                                      " " +
                                                                      "Miles"),
                                                            ),
                                                          ),
                                                          value: Controller
                                                                      .dropDownValue1 ==
                                                                  null
                                                              ? null
                                                              : Controller
                                                                  .dropDownValue1,
                                                          onChanged: (value) {
                                                            Controller
                                                                    .checkListModel
                                                                    .value
                                                                    .data!
                                                                    .distance =
                                                                value
                                                                    .toString();
                                                          }),
                                                    )
                                                  : SizedBox.shrink(),
                                              Checkbox(
                                                activeColor:
                                                    const Color(0xFFffffff),
                                                checkColor:
                                                    const Color(0xff4169DD),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                side: MaterialStateBorderSide
                                                    .resolveWith(
                                                  (states) => const BorderSide(
                                                      width: 1.0,
                                                      color: Color(0xFF4169dd)),
                                                ),
                                                value: Controller
                                                    .checkListModel
                                                    .value
                                                    .data!
                                                    .documentMileage,
                                                onChanged: (value) {
                                                  Controller
                                                      .checkListModel
                                                      .value
                                                      .data!
                                                      .documentMileage = true;
                                                  setState(() {});
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 15),
                                          height: 70,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: Colors.white,
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('End of Watch'),
                                              Controller.checkListModel.value
                                                          .data!.callLocal ==
                                                      true
                                                  ? Container(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 12.0,
                                                          vertical: 12.0),
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xffF1F5FF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4)),
                                                      child: GestureDetector(
                                                        child: Text(
                                                          Controller
                                                              .outputFormat
                                                              .format(DateTime
                                                                  .parse(Controller
                                                                      .checkListModel
                                                                      .value
                                                                      .data!
                                                                      .exitTime!)),
                                                          textAlign:
                                                              TextAlign.center,
                                                          textScaleFactor: 1.0,
                                                        ),
                                                      ),
                                                    )
                                                  : SizedBox.shrink(),
                                              Checkbox(
                                                activeColor:
                                                    const Color(0xFFffffff),
                                                checkColor:
                                                    const Color(0xff4169DD),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                side: MaterialStateBorderSide
                                                    .resolveWith(
                                                  (states) => const BorderSide(
                                                      width: 1.0,
                                                      color: Color(0xFF4169dd)),
                                                ),
                                                value: Controller.checkListModel
                                                    .value.data!.callLocal,
                                                onChanged: (value) {
                                                  if (Controller
                                                          .checkListModel
                                                          .value
                                                          .data!
                                                          .callLocal ==
                                                      false) {
                                                    Controller
                                                        .checkListModel
                                                        .value
                                                        .data!
                                                        .callLocal = true;
                                                    Controller
                                                            .checkListModel
                                                            .value
                                                            .data!
                                                            .exitTime =
                                                        DateTime.now()
                                                            .toString();

                                                    // Controller.exitTime =
                                                    //     Controller
                                                    //         .outputFormat
                                                    //         .format(
                                                    //             DateTime.now());

                                                    print("Date " +
                                                        " " +
                                                        Controller
                                                            .checkListModel
                                                            .value
                                                            .data!
                                                            .arriveTime
                                                            .toString());
                                                    print("Date 1 " +
                                                        " " +
                                                        Controller.arriveTime
                                                            .toString());
                                                    setState(() {});
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ]),
                            ]),
                      ),
                      const Expanded(child: SizedBox()),
                      CommonButton('Done', () {
                        if (_formKey.currentState!.validate()) {
                          updateParameters();
                        }
                      }, deviceWidth),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                );
        }));
  }
}
