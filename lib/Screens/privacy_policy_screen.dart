import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/privacy_policy_controller.dart';
import '../widgets/common_widget_button.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  String? text;
  String? slug;

  PrivacyPolicyScreen({
    Key? key,
    this.text,
    required String slug,
  }) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  final PrivacyPolicyController controller = Get.put(PrivacyPolicyController());

  @override
  void initState() {
    super.initState();
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomIcon('Privacy Policy', () {
          Get.back();
        }),
        body: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text('Privacy Policy',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(controller.model.value.data!.content.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      )),
                ),
              ]),
        ));
  }
}
