import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/common_button.dart';
import '../widgets/common_widget_button.dart';

class JobDetailsPageScreen extends StatefulWidget {


  const JobDetailsPageScreen({Key? key}) : super(key: key);

  @override
  State<JobDetailsPageScreen> createState() => _JobDetailsPageScreenState();
}

class _JobDetailsPageScreenState extends State<JobDetailsPageScreen> {

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width * 0.60;
    return Scaffold(
      appBar: CustomIcon('Details', (){
        Get.back();
      }),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                              color: Color(0xff4169DD),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Text(
                            'ET',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Employee Termination",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Residential",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.blue),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: const [
                            Text("Start Time"),
                            Text("09.00 AM"),
                          ],
                        ),
                        Column(
                          children: const [
                            Text("End Time"),
                            Text("10.00 AM"),
                          ],
                        ),
                        Column(
                          children: const [
                            Text("No of agents"),
                            Text("5"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Basic Information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Client Name",
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                "Abc Company",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Divider(),
              Text(
                "Detail Specifics",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Cleint Name",
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                "Abc Company",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CommonButton('Done', () { }, deviceWidth),
            ],
          ),
        ),
      ),
    );
  }

  void onApplyTap() {
    showDialog(
        context: context,
        builder: (_) => Dialog(
              child: Container(
                height: 250,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset('assets/images/submit.png'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Submited",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                   // CommonButton('Done', () { }, deviceWidth),
                  ],
                ),
              ),
            ));
  }
}
