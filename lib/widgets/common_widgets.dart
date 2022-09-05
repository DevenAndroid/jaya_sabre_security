import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabre_security_app/resources/theme/app_theme.dart';
import 'package:sabre_security_app/router/my_router/my_router.dart';

import '../controllers/is_userAvailable_controller.dart';
import '../controllers/notification_controller.dart';
import '../repository/is_available_user_update_repo.dart';
import '../utils/ApiConstant.dart';

PreferredSize homeAppBar(title, GestureTapCallback openDrawer) {
  bool _isOn = false;
  final IsAvailabilityController controller =
      Get.put(IsAvailabilityController());

  final NotificationController Controller = Get.put(NotificationController());

  bool checked = true;

  return PreferredSize(
      preferredSize: Size.fromHeight(70.0),
      child: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        )),
        // backgroundColor: title == 'Home' ? Colors.white : AppTheme.primaryColor,
        backgroundColor: AppTheme.primaryColor,
        leading: Builder(
          builder: (context) => InkWell(
            onTap: openDrawer,
            child: Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: title == 'Profile' ||
                      title == 'Home' ||
                      title == 'Assignment' ||
                      title == 'Availability' ||
                      title == 'Edit Profile'
                  ? IconButton(
                      icon: Icon(
                        Icons.menu_outlined,
                        size: 18,
                      ),
                      onPressed: () => Scaffold.of(context).openDrawer())
                  : SizedBox.shrink(),
            ),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(),
        ),
        centerTitle: true,
        actions: <Widget>[
          Visibility(
            visible: title == 'Profile',
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
                  Icons.edit,
                  size: 18,
                ),
                tooltip: title,
                onPressed: () {
                  Get.toNamed(MyRouter.editProfileScreen);
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          !controller.isDataLoading.value
              ? CupertinoActivityIndicator()
              : Visibility(
                  visible: title == 'Availability',
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
                                  (value) => showToast('User not Available'));
                            } else {
                              controller.model.value.data!.isAvailable!.value =
                                  "1";
                              isUserAvailableUserUpdate('1')
                                  .then((value) => showToast('User Available'));
                            }
                          }),
                    );
                  }),
                ),

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

          Visibility(
            visible: title == 'Edit Profile',
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              tooltip: title,
              onPressed: () {
                // ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          ),
        ],
      ));
}
