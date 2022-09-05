import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/availability_controller.dart';
import '../controllers/is_userAvailable_controller.dart';
import '../repository/user_availibility_update_repo.dart';
import '../utils/ApiConstant.dart';
import '../widgets/common_button.dart';
import '../widgets/common_widget_button.dart';

class AvailabilityScreen extends StatefulWidget {
  final bool? showOwnAppBar;

  const AvailabilityScreen({super.key, this.showOwnAppBar = false});

  @override
  AvailabilityScreenState createState() => AvailabilityScreenState();
}

class AvailabilityScreenState extends State<AvailabilityScreen> {
  final AvailabilityController controller = Get.put(AvailabilityController());
  final IsAvailabilityController controller1 =
      Get.put(IsAvailabilityController());

  var formate11 = DateFormat.HOUR24_MINUTE_SECOND;
  var outputFormat = DateFormat('hh:mm a');

  @override
  void initState() {
    super.initState();
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var deviceWidth = MediaQuery.of(context).size.width * 0.65;
    return Obx(() {
      return Scaffold(
          appBar: widget.showOwnAppBar == true
              ? CustomIcon('My Availability', () {
                  Get.back();
                })
              : null,
          body: controller.isDataLoading.value == true
              ? controller.model.value.data!.weekData!.isEmpty
                  ? Center(child: Text('No Data found'))
                  : SingleChildScrollView(
                      child: Container(
                        height: 800,
                        child: Column(
                          children: [
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  controller.model.value.data!.weekData!.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  margin: const EdgeInsets.only(
                                      top: 5, bottom: 9, left: 5, right: 5),
                                  child: Padding(
                                    // padding: EdgeInsets.only(
                                    //     top: 5, bottom: 5, left: 5, right: 5),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2.0, vertical: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.model.value.data!
                                              .weekData![index].day
                                              .toString()
                                              .capitalizeFirst!,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Obx(() {
                                          return Row(
                                            children: [
                                              _buildTimePick(
                                                  "Start Time :",
                                                  true,
                                                  controller
                                                      .model
                                                      .value
                                                      .data!
                                                      .weekData![index]
                                                      .startTime
                                                      .toString(),
                                                  (x) {},
                                                  index,
                                                  controller1
                                                              .model
                                                              .value
                                                              .data!
                                                              .isAvailable!
                                                              .value ==
                                                          "1"
                                                      ? true
                                                      : false),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              _buildTimePick1(
                                                  "End Time: ",
                                                  true,
                                                  controller.model.value.data!
                                                      .weekData![index].endTime
                                                      .toString(), (x) {
                                                setState(() {});
                                              },
                                                  index,
                                                  controller1
                                                              .model
                                                              .value
                                                              .data!
                                                              .isAvailable!
                                                              .value ==
                                                          "1"
                                                      ? true
                                                      : false),
                                            ],
                                          );
                                        })
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            CommonButton('Update', () {
                              bool allow = false;
                              for (var item
                                  in controller.model.value.data!.weekData!) {
                                if (item.startTime != "00:00") {
                                  allow = true;
                                }
                                if (item.endTime != "00:00") {
                                  allow = true;
                                }
                              }

                              if (allow) {
                                // showToast("Allow");
                                userAvailibilityUpdate(
                                  controller
                                      .model.value.data!.weekData![0].startTime
                                      .toString(),
                                  controller
                                      .model.value.data!.weekData![0].endTime
                                      .toString(),
                                  controller
                                      .model.value.data!.weekData![1].startTime
                                      .toString(),
                                  controller
                                      .model.value.data!.weekData![1].endTime
                                      .toString(),
                                  controller
                                      .model.value.data!.weekData![2].startTime
                                      .toString(),
                                  controller
                                      .model.value.data!.weekData![2].endTime
                                      .toString(),
                                  controller
                                      .model.value.data!.weekData![3].startTime
                                      .toString(),
                                  controller
                                      .model.value.data!.weekData![3].endTime
                                      .toString(),
                                  controller
                                      .model.value.data!.weekData![4].startTime
                                      .toString(),
                                  controller
                                      .model.value.data!.weekData![4].endTime
                                      .toString(),
                                  controller
                                      .model.value.data!.weekData![5].startTime
                                      .toString(),
                                  controller
                                      .model.value.data!.weekData![5].endTime
                                      .toString(),
                                  controller
                                      .model.value.data!.weekData![6].startTime
                                      .toString(),
                                  controller
                                      .model.value.data!.weekData![6].endTime
                                      .toString(),
                                ).then((value) {
                                  showToast(value.message);
                                });
                              } else {
                                showToast("First select your job timing");
                              }
                            }, deviceWidth),
                          ],
                        ),
                      ),
                    )
              : Center(
                  child: CircularProgressIndicator(
                    color: Colors.lightBlue,
                  ),
                ));
    });
  }

  ///start time
  Future selectedTime(
      BuildContext context,
      bool ifPickedTime,
      TimeOfDay initialTime,
      Function(TimeOfDay) onTimePicked,
      String times,
      int index) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    // if (pickedTime != null) {
    //   setState(() {
    //     controller.model.value.data!.weekData![index].startTime =
    //         pickedTime.format(context);
    //   });
    //   print('time::::' +
    //       pickedTime.format(context).toString().replaceAll('AM', ''));
    //   //"${pickedTime.hour}:${pickedTime.minute}";
    //   // pickedTime.hour.toString() + ":" + pickedTime.minute.toString();
    //   //times = "${pickedTime.hour}:${pickedTime.minute}";
    //   times = pickedTime.format(context);
    //   print("times :::dffg01::::" + pickedTime.toString());
    //   print("times :::::::" + times.toString());
    //
    //   setState(() {});
    // }

    if (pickedTime != null) {
      /// Testing
      // String value = "2022-08-26 " + pickedTime.hour.toString() + ":" + pickedTime.minute.toString() + "0:60.00000";
      // String value1 =
      //     pickedTime.hour.toString() + ":" + pickedTime.minute.toString();
      // var outputFormat = DateFormat('hh:mm a');
      // value = DateTime.now().toString();
      // value1 = DateTime.now().toString();

      var hr = "";
      var min = "";
      if (pickedTime.hour < 10) {
        hr = "0" + pickedTime.hour.toString();
        // hr = pickedTime.hour.toString() + ":" + pickedTime.minute.toString();
      } else {
        hr = pickedTime.hour.toString();
      }

      if (pickedTime.minute < 10) {
        min = "0" + pickedTime.minute.toString();
        // hr = pickedTime.hour.toString() + ":" + pickedTime.minute.toString();
      } else {
        min = pickedTime.minute.toString();
      }

      controller.model.value.data!.weekData![index].startTime = hr + ":" + min;

      print(controller.model.value.data!.weekData![index].startTime);
      setState(() {});
      // print(value);
      // print(value1);

    }
  }

  ///End time
  Future selectedTime1(
      BuildContext context,
      bool ifPickedTime,
      TimeOfDay initialTime,
      Function(TimeOfDay) onTimePicked,
      String times,
      int index) async {
    final TimeOfDay? _pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (_pickedTime != null) {
      var hr = "";
      var min = "";
      if (_pickedTime.hour < 10) {
        hr = "0" + _pickedTime.hour.toString();
        // hr = pickedTime.hour.toString() + ":" + pickedTime.minute.toString();
      } else {
        hr = _pickedTime.hour.toString();
      }

      if (_pickedTime.minute < 10) {
        min = "0" + _pickedTime.minute.toString();
        // hr = pickedTime.hour.toString() + ":" + pickedTime.minute.toString();
      } else {
        min = _pickedTime.minute.toString();
      }

      controller.model.value.data!.weekData![index].endTime = hr + ":" + min;

      print(controller.model.value.data!.weekData![index].endTime);
      setState(() {});
    }
  }

  Widget _buildTimePick(String title, bool ifPickedTime, String currentTime,
      Function(TimeOfDay) onTimePicked, int index, bool availability) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          decoration: BoxDecoration(
              color: const Color(0xffF1F5FF),
              borderRadius: BorderRadius.circular(4)),
          child: GestureDetector(
            child: Text(
              currentTime != ""
                  ? title +
                      '\n' +
                      outputFormat.format(DateTime.parse(
                          "2022-08-26 " + currentTime + ":00.00000"))
                  : title + '\n' + "- - : - -",
              // + currentTime.format(context),
              textAlign: TextAlign.center,
              textScaleFactor: 1.0,
            ),
            onTap: () {
              print(availability);
              if (availability) {
                TimeOfDay time;
                DateTime dateTime = DateFormat('HH:mm', 'en_US')
                    .parse(currentTime != "" ? currentTime : "00:00");
                time = TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
                print("time");
                print(time);
                selectedTime(context, ifPickedTime, time, onTimePicked,
                    currentTime, index);
              }
            },
          ),
        ),
        SizedBox(
          width: 18,
        )
      ],
    );
  }

  Widget _buildTimePick1(String title, bool ifPickedTime, String currentTime,
      Function(TimeOfDay) onTimePicked, int index, bool availability) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          decoration: BoxDecoration(
              color: const Color(0xffF1F5FF),
              borderRadius: BorderRadius.circular(4)),
          child: GestureDetector(
            child: Text(
              currentTime != ""
                  ? title +
                      '\n' +
                      outputFormat.format(DateTime.parse(
                          "2022-08-26 " + currentTime + ":00.00000"))
                  : title + '\n' + "- - : - -",
              textAlign: TextAlign.center,
              textScaleFactor: 1.0,
            ),
            onTap: () {
              print(availability);
              if (availability) {
                TimeOfDay time;
                DateTime dateTime = DateFormat('HH:mm', 'en_US')
                    .parse(currentTime != "" ? currentTime : "00:00");
                time = TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
                selectedTime1(context, ifPickedTime, time, onTimePicked,
                    currentTime, index);
              }
            },
          ),
        ),
      ],
    );
  }
}

class ItemLists {
  String? day;
  String? startTime;
  String? endTime;

  ItemLists({this.day, this.startTime, this.endTime});
}
