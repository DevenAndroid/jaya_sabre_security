import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabre_security_app/models/ModelCertificateNotification.dart';

import '../controllers/certificate_notification_controller.dart';
import '../repository/get_save_certificate_notification_repository.dart';
import '../router/my_router/my_router.dart';
import '../utils/ApiConstant.dart';
import '../widgets/common_button.dart';
import '../widgets/common_widget_button.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final CertificateNotificationController controller =
      Get.put(CertificateNotificationController());

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width * 0.65;
    return Scaffold(
      appBar: CustomIcon('  Certificate\n Notification', () {
        Get.back();
      }),
      body: Obx(() {
        return !controller.dataLoad.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller
                          .certificateNotificationModel.value.data!.length,
                      itemBuilder: (context, index) {
                        return item(controller
                            .certificateNotificationModel.value.data![index]);
                      }),
                  const Spacer(),
                  CommonButton('Subscribe', () {
                    var status = "";
                    for (var item in controller
                        .certificateNotificationModel.value.data!) {
                      if (item.checked == true) {
                        if (status == "") {
                          status = item.id.toString();
                        } else {
                          status = status + ',' + item.id.toString();
                        }
                      }
                    }
                    print("DATA CERTIFICATE" + status);
                    saveCertificateNotification(status).then((value) {
                      showToast(value.message);
                      if (value.status == true) {
                        Get.toNamed(MyRouter.bottomNavbarScreen);
                      }
                    });
                  }, deviceWidth),
                  const SizedBox(
                    height: 20,
                  )
                ],
              );
      }),
    );
  }

  Widget item(Data data) {
    return InkWell(
      onTap: () {
        //Get.toNamed(MyRouter.detailsScreen , arguments: [data]);
      },
      child: Card(
          // The checkboxes will be her
          margin: EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                          value: data.checked,
                          onChanged: (newValue) {
                            setState(() {
                              data.checked = newValue;
                            });
                          }),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
