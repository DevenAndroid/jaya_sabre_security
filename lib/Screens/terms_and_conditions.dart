import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/terms_and_condition_controller.dart';
import '../widgets/common_widget_button.dart';

class TermsAndConditionScreen extends StatefulWidget {
  String? text;
  String? slug;

  TermsAndConditionScreen({
    Key? key,
    this.text,
    required String slug,
  }) : super(key: key);

  @override
  State<TermsAndConditionScreen> createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  final TermsAndConditionsController controller =
      Get.put(TermsAndConditionsController());

  @override
  void initState() {
    super.initState();
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomIcon('Terms & Condition', () {
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
                  child: Text('Terms and Condition',
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
                  child: Text(controller.model1.value.data!.content.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      )),
                ),
              ]),
        ));
  }
}
