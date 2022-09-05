import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:sabre_security_app/utils/ApiConstant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/registration_controller.dart';
import '../../repository/register_stepThree_repository.dart';
import '../../resources/theme/app_theme.dart';
import '../../router/my_router/my_router.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_formfields.dart';

class BioAboutScreen extends StatefulWidget {
  const BioAboutScreen({Key? key}) : super(key: key);

  @override
  State<BioAboutScreen> createState() => _BioAboutScreenState();
}

class _BioAboutScreenState extends State<BioAboutScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool vaccinationValue = false;
  late AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;

  RegistrationController controller = Get.put(RegistrationController());

  TextEditingController investigationExperienceController =
      TextEditingController();
  TextEditingController shortBioController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<SelectType> dataList = [
    SelectType("Military", false, "military"),
    SelectType("Police", false, "police"),
    SelectType("Close Protection", false, "close_protection"),
    SelectType("Executive Protection", false, "executive_protection"),
    SelectType("Advanced Driving Course", false, "advance_course"),
    SelectType("None of above", false, "none_of_above"),
  ];

  String testDate = "";
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  TextEditingController Dobcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            width: deviceWidth,
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  '   What experience do you have?',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            dataList[index].selected =
                                !dataList[index].selected!;
                          });
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                                value: dataList[index].selected,
                                onChanged: (val) {
                                  dataList[index].selected = val!;
                                  setState(() {});
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(dataList[index].value.toString()),
                          ],
                        ),
                      );
                    }),
                const SizedBox(
                  height: 15,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Investigation Experience?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    )),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
                  decoration: const InputDecoration(
                      hintText: "Please List examples?",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      labelStyle: TextStyle(color: Colors.white)),
                  // textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  controller: investigationExperienceController,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'When did you last take an advance driving course?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    )),
                const SizedBox(
                  height: 15,
                ),
                CommonTextFieldWidget(
                  suffix: InkWell(
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (selectedDate != null) {
                          // print(_selectedDate);
                          testDate = selectedDate.toString();
                          print(testDate);
                          String formattedDate =
                              DateFormat.yMMMMd('en_US').format(selectedDate);
                          // print(formattedDate);
                          setState(() {
                            controller.drivingDate.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                      child: const Icon(Icons.calendar_today_rounded)),
                  hint: 'DD/MM/YYYY',
                  controller: controller.drivingDate,
                  bgColor: AppTheme.primaryColor,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Are You Vaccinated?',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                shape: const CircleBorder(),
                                checkColor: AppTheme.primaryColor,
                                activeColor: Colors.grey,
                                value: vaccinationValue,
                                onChanged: (bool? value) {
                                  setState(() {
                                    vaccinationValue = true;
                                  });
                                },
                              ),
                            ),
                            const Text('Yes'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                shape: const CircleBorder(),
                                checkColor: AppTheme.primaryColor,
                                activeColor: Colors.grey,
                                value: !vaccinationValue,
                                onChanged: (bool? value) {
                                  setState(() {
                                    vaccinationValue = false;
                                  });
                                },
                              ),
                            ),
                            const Text('No'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Short Bio of you',
                      style: TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
                  // autovalidateMode: autovalidateMode,
                  // onChanged: (value) {
                  //   if (value != "") {
                  //     autovalidateMode = AutovalidateMode.disabled;
                  //   }
                  // },
                  decoration: const InputDecoration(
                      hintText: "Please List examples?",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  controller: shortBioController,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: CommonButton('Submit', () async {
                    var experience = '';
                    if (controller.step1 == false) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("First Submit personal details")));
                    } else if (controller.step2 == false) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("First Submit License details")));
                    } else if (_formKey.currentState!.validate()) {
                      for (var item in dataList) {
                        if (item.selected == true) {
                          if (experience == '') {
                            experience = item.value1.toString();
                          } else {
                            experience =
                                experience + ',' + item.value1.toString();
                          }
                        }
                      }
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      var userId = pref.getString('userId');
                      print(userId);
                      print(userId);
                      print(userId);
                      registerStepThree(
                              context,
                              userId,
                              experience,
                              investigationExperienceController.text,
                              testDate,
                              vaccinationValue == true ? 'yes' : 'no',
                              shortBioController.text)
                          .then((value) {
                        print(jsonEncode(value));
                        showToast1(value.message);
                        if (value.status!) {
                          Get.toNamed(MyRouter.verifyEmailScreen, arguments: [
                            value.data!.otp.toString(),
                            value.data!.userId.toString(),
                            controller.email1.text,
                          ]);
                        }
                      });
                    }
                  }, MediaQuery.of(context).size.width * 0.60),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SelectType {
  final String? value;
  final String? value1;
  bool? selected = false;

  SelectType(this.value, this.selected, this.value1);
}
