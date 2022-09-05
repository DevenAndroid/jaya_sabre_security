import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabre_security_app/models/model_assignment.dart';
import 'package:sabre_security_app/resources/theme/app_theme.dart';
import 'package:sabre_security_app/router/my_router/my_router.dart';
import '../controllers/assignment_controller.dart';
import '../widgets/common_button.dart';
import '../widgets/common_widget_button.dart';

class AssignmentScreen extends StatefulWidget {
  final bool? showOwnAppBar;

  const AssignmentScreen({Key? key, this.showOwnAppBar}) : super(key: key);

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  AssignmentController controller = Get.put(AssignmentController());

  bool selected = false;

  @override
  void initState() {
    super.initState();
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showOwnAppBar == true
          ? CustomIcon('My Assignment', () {
              Get.back();
            })
          : null,
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getData();
        },
        child: Obx(() {
          return controller.dataLoaded.value == true
              ? controller.model.value.data!.isEmpty
                  ? Center(child: Text('No Data found'))
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.model.value.data!.length,
                          itemBuilder: (context, index) {
                            return item(
                                controller.model.value.data![index], index);
                          }),
                    )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        }),
      ),
    );
  }

  Widget item(UserAssignment data, int index) {
    return InkWell(
      onTap: () {
        // Get.to(EmployeeTerminationScreen());
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.title.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  data.isDone!
                      ? Container(
                          height: 35,
                          width: 55,
                          decoration: BoxDecoration(
                              color: AppTheme.assignmentbox,
                              border: Border.all(color: AppTheme.assignmentbox),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Done',
                              style: TextStyle(
                                  color: Colors.lightGreenAccent, fontSize: 16),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            Get.toNamed(MyRouter.checklistScreen,
                                arguments: [data.id.toString(), index]);
                          },
                          child: data.isCheck == true
                              ? Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6))),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.green,
                                    size: 15,
                                  ))
                              : Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6))),
                                ),
                        ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Image.asset('assets/icons/loaction.png'),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    data.jobLocation.toString(),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff80838D)),
                  )
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                data.description.toString(),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    height: 1.4,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff80838D)),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Image.asset('assets/icons/calendraicon.png'),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    '${data.assignmentStartDate.toString()} - '
                    '${data.assignmentEndDate.toString()}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff80838D)),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Image.asset('assets/icons/watch_grey.png'),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    '${data.startTime.toString()} - '
                    '${data.endTime.toString()}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff80838D)),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/icons/dollericon.png'),
                      SizedBox(
                        width: 4,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: 'Pay Rate: ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff80838D))),
                            TextSpan(
                              text: '\$' + data.payRate.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff4169DD)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(data.clientName.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff80838D)))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog() {
    var deviceWidth = MediaQuery.of(context).size.width * 0.20;
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
                height: 50,
              ),
              const Text(
                'Please click on checklist once \n you reach at site',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                // padding: EdgeInsets.only(top: 20),
                child: CommonButton('OK', () {
                  Get.back();
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
}
