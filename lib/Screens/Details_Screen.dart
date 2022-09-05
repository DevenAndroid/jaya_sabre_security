import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sabre_security_app/models/ModelHomeData.dart';
import 'package:sabre_security_app/resources/theme/app_theme.dart';
import 'package:sabre_security_app/router/my_router/my_router.dart';
import 'package:sabre_security_app/utils/ApiConstant.dart';
import 'package:sabre_security_app/widgets/common_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/get_applyjob_repository.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final primaryColor = const Color(0xFF4169DD);
  ModelHomeJobsData item = Get.arguments[0];
  // ModelAssignment assignment

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width * 0.50;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.bodybackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                PreferredSize(
                    preferredSize: const Size.fromHeight(100.0),
                    child: AppBar(
                      systemOverlayStyle:
                          SystemUiOverlayStyle(statusBarColor: primaryColor),
                      toolbarHeight: 110,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20),
                      )),
                      backgroundColor: primaryColor,
                      leading: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          margin: const EdgeInsets.only(
                              top: 20, bottom: 45, left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child:
                              const Icon(Icons.arrow_back, color: Colors.white),
                        ),
                      ),
                      actions: [
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          margin: const EdgeInsets.only(
                              top: 20, bottom: 45, left: 10),
                          child: Icon(
                            Icons.notifications_outlined,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    )),
                Positioned(
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 100),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppTheme.bodycardColor,
                      ),
                      height: screenSize.width * 0.6,
                      width: screenSize.width * 0.9,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            item.profileImage.toString()),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(8)),
                                height: 60,
                                width: 74,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: AppTheme.detaillocation,
                                      ),
                                      height: screenSize.width * 0.05,
                                      width: screenSize.width * 0.20,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(item.jobLocation.toString(),
                                            style:
                                                TextStyle(color: primaryColor)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(
                            height: 1,
                            thickness: 1,
                            indent: 1,
                            endIndent: 0,
                            color: Color(0xffE6EAF6),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    'Start Time',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    item.startTime.toString(),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'End Time',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    item.endTime.toString(),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'No. of agents',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    item.numberOfAgents.toString(),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                      top: 30.0,
                      left: 25,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Text(
                              'Basic Information',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        commonRow('Client Name', item.clientName.toString()),
                        commonRow('Pay Rate', item.payRate.toString()),
                        commonRow('Date of Assignment',
                            item.assignmentStartDate.toString()),
                        commonRow('Point of Contact',
                            item.pointContactname.toString()),
                        commonRow('Point of Contact Cell Phone',
                            item.pointPhonenumber.toString()),
                        commonRow('Location', item.jobLocation.toString()),
                        commonRow('Address', item.jobAddress.toString()),
                        const Divider(
                          height: 1,
                          thickness: 2,
                          indent: 1,
                          endIndent: 0,
                          color: Color(0xffDEE3F2),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Text(
                              'Detail Specifics',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        commonRow('Agent Name', item.agentAttire.toString()),
                        commonRow('Armed', item.armed.toString()),
                        commonRow('Concealed', item.concealed.toString()),
                        const SizedBox(height: 10),
                        // Row(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: <Widget>[
                        //       ElevatedButton(
                        //         onPressed: () {
                        //
                        //         },
                        //         child: const Text('Apply'),
                        //       ),
                        //     ])
                        Container(
                          padding: EdgeInsets.only(top: 20, right: 30),
                          child: CommonButton('Apply', () {
                            getAppliedJob(context, item.id.toString())
                                .then((value) async {
                              print('DATA :::' + item.id.toString());
                              if (value.status!) {
                                // SharedPreferences pref =
                                //     await SharedPreferences.getInstance();
                                // pref.setString('userId',
                                //     jsonEncode(value.data!.user.toString()));
                                // var userId = pref.getString('userId');
                                // showToast(value.message);
                                showAlertDialog();
                              } else {
                                showToast(value.message);
                              }
                              return;
                            });
                          }, deviceWidth),
                        )
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog() {
    var deviceWidth = MediaQuery.of(context).size.width * 0.30;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Container(
          width: 500.0,
          height: 270.0,
          child: Column(
            //  mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/submitted_logo.png',
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Submit',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                // padding: EdgeInsets.only(top: 20),
                child: CommonButton('OK', () {
                  showToast('Job Applied Successfully');
                  Get.offAllNamed(MyRouter.bottomNavbarScreen);
                }, deviceWidth),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  commonRow(String text1, text2) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Text(
                text1,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                text2,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
