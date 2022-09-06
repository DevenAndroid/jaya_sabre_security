import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabre_security_app/controllers/notification_controller.dart';
import 'package:sabre_security_app/repository/notification_status_repository.dart';
import 'package:sabre_security_app/widgets/common_widgets.dart';
import '../widgets/common_widget_button.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final Controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Controller.dataLoaded.value == false
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              appBar: CustomIcon("Notification", () {
                Controller.getData();
                Get.back();
              }),
              backgroundColor: const Color(0xffE9E9E9),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Controller.notificationModel.value.data!.isEmpty
                          ? Center(child: Text('No Data found'))
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: Controller
                                  .notificationModel.value.data!.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(Controller
                                              .notificationModel
                                              .value
                                              .data![index]
                                              .date
                                              .toString()),
                                        ),
                                      ],
                                    ),
                                    ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: Controller
                                            .notificationModel
                                            .value
                                            .data![index]
                                            .notifications!
                                            .length,
                                        itemBuilder: (context, index1) {
                                          return GestureDetector(
                                            onTap: () {
                                              print(":::::::" +
                                                  Controller
                                                      .notificationModel
                                                      .value
                                                      .data![index]
                                                      .notifications![index1]
                                                      .id
                                                      .toString());

                                              updateNotificationStatus(
                                                      context,
                                                      Controller
                                                          .notificationModel
                                                          .value
                                                          .data![index]
                                                          .notifications![
                                                              index1]
                                                          .id
                                                          .toString(),
                                                      'seen')
                                                  .then((value) {
                                                if (value.status) {
                                                  Controller.getData();
                                                }
                                                return null;
                                              });
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  top: 15, left: 5, bottom: 1),
                                              margin: const EdgeInsets.only(
                                                  top: 10, left: 10, right: 5),
                                              height: 100,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Image.asset(
                                                        'assets/icons/notify.png',
                                                        height: 40,
                                                        width: 40,
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        Controller
                                                            .notificationModel
                                                            .value
                                                            .data![index]
                                                            .notifications![
                                                                index1]
                                                            .title
                                                            .toString(),
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      const Expanded(
                                                          child: SizedBox()),
                                                      Text(Controller
                                                          .notificationModel
                                                          .value
                                                          .data![index]
                                                          .notifications![
                                                              index1]
                                                          .time
                                                          .toString()),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 50),
                                                    child: Text(
                                                        Controller
                                                            .notificationModel
                                                            .value
                                                            .data![index]
                                                            .notifications![
                                                                index1]
                                                            .body
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 14)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        })
                                  ],
                                );
                              },
                            ),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}
