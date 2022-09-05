import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabre_security_app/controllers/sop_controller.dart';

import '../widgets/common_widget_button.dart';


class FaqScreen extends StatefulWidget {
  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {

  final Controller = Get.put(SopController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomIcon('Sop', (){
          Get.back();
        }),
        body: Obx(() {
            return Controller.dataLoaded.value == false
                ? const Center(
              child: CircularProgressIndicator(),
            )
                :  Container(
              margin: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: Controller.sopModel.value.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.black, width: .5)),
                    margin: const EdgeInsets.all(10),
                    child: ExpansionTile(
                      title:  Text(Controller.sopModel.value.data![index].title.toString(),
                          style: TextStyle(fontSize: 18)),
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          child:  Text(Controller.sopModel.value.data![index].description.toString()
                            ,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        ));
  }
}
