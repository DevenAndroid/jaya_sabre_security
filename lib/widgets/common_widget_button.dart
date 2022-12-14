import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sabre_security_app/resources/theme/app_theme.dart';

import '../controllers/is_userAvailable_controller.dart';
import '../controllers/notification_controller.dart';
import '../repository/is_available_user_update_repo.dart';
import '../router/my_router/my_router.dart';
import '../utils/ApiConstant.dart';

PreferredSize CustomIcon(title, GestureTapCallback openDrawer) {
  final IsAvailabilityController controller =
      Get.put(IsAvailabilityController());

  final NotificationController Controller = Get.put(NotificationController());

  return PreferredSize(
      preferredSize: Size.fromHeight(70.0),
      child: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        )),
        backgroundColor: AppTheme.primaryColor,
        leading: Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 20,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        title: Text(
          title,
        ),
        centerTitle: true,
        actions: <Widget>[
          // Visibility(
          //   visible: title == 'Edit Profile',
          //   child: Container(
          //     margin: EdgeInsets.all(8.0),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       border: Border.all(
          //         color: Colors.grey,
          //       ),
          //     ),
          //     child: IconButton(
          //       icon: const Icon(Icons.edit,
          //         size: 20,
          //       ),
          //       tooltip: title,
          //       onPressed: () {
          //         // ScaffoldMessenger.of(context).showSnackBar(
          //         //     const SnackBar(content: Text('This is a snackbar')));
          //       },
          //     ),
          //   ),
          // ),
          Visibility(
            visible: title == 'Assignment',
            child: Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                ),
                tooltip: title,
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),

          !controller.isDataLoading.value
              ? CupertinoActivityIndicator()
              : Visibility(
                  visible: title == 'My Availability',
                  child: //toggle
                      Obx(() {
                    return Container(
                      padding: const EdgeInsets.all(6.0),
                      margin: const EdgeInsets.all(6.0),
                      child: CupertinoSwitch(
                          trackColor: CupertinoColors.white,
                          value:
                              controller.model.value.data!.isAvailable!.value ==
                                      "1"
                                  ? true
                                  : false,
                          onChanged: (val) {
                            if (controller
                                    .model.value.data!.isAvailable!.value ==
                                "1") {
                              controller.model.value.data!.isAvailable!.value =
                                  "0";
                              isUserAvailableUserUpdate('0').then(
                                  (value) => showToast('User Not Avalilable'));
                            } else {
                              controller.model.value.data!.isAvailable!.value =
                                  "1";
                              isUserAvailableUserUpdate('1').then((value) {
                                controller.update();
                                showToast('User Available');
                              });
                            }
                          }),
                    );
                  }),
                ),
          // Visibility(
          //   visible: title == 'Upload Certificates',
          //   child: IconButton(
          //     icon: const Icon(Icons.arrow_back),
          //     tooltip: title,
          //     onPressed: () {
          //       // ScaffoldMessenger.of(context).showSnackBar(
          //       //     const SnackBar(content: Text('This is a snackbar')));
          //     },
          //   ),
          // ),

          ///Home notification icon
          Obx(() {
            return Stack(children: [
              Visibility(
                visible: title == 'Home',
                child: IconButton(
                  icon: const Icon(
                    Icons.notifications_outlined,
                    size: 30,
                  ),
                  tooltip: title,
                  onPressed: () {
                    Get.toNamed(MyRouter.notificationsScreen);
                  },
                ),
              ),
              Controller.notificationModel.value.status == true
                  ? Positioned(
                      right: 5,
                      top: 5,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 20,
                          width: 20,
                          // backgroundColor: AppTheme.loginLabelColor,
                          // radius: 12,
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 10,
                              child: Text(
                                Controller.notificationModel.value.count
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 9, fontWeight: FontWeight.w800),
                              )),
                        ),
                      ))
                  : SizedBox.shrink(),
            ]);
          }),
        ],
      ));
}
