import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabre_security_app/models/ModelHomeData.dart';
import 'package:sabre_security_app/resources/theme/app_theme.dart';
import '../controllers/getHomeController.dart';
import '../controllers/notification_controller.dart';
import '../router/my_router/my_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(GetHomeController());
  final Controller = Get.put(NotificationController());

  @override
  void deactivate() {
    super.deactivate();
    // controller.onClose();
  }

  @override
  void initState() {
    super.initState();
    controller.getData();
    Controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bodybackground,
      body: Obx(() {
        return !controller.isDataLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12),
                      child: const Text(
                        'Available Assignments',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.model.value.data!.length,
                        itemBuilder: (context, index) {
                          return item(controller.model.value.data![index]);
                        }),
                  ],
                ),
              );
      }),
    );
  }

  Widget item(ModelHomeJobsData data) {
    return InkWell(
      onTap: () {
        Get.toNamed(MyRouter.detailsScreen, arguments: [data]);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Card(
            color: AppTheme.bodycardColor,
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.title.toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data.createdDate.toString(),
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff80838D)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Image.asset('assets/icons/loaction.png'),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        data.jobLocation.toString(),
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff80838D)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.description.toString(),
                    style: const TextStyle(
                        height: 1.4,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff80838D)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/calendraicon.png',
                        height: 20,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        data.assignmentStartDate.toString() + ' -',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff80838D)),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        data.assignmentEndDate.toString(),
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff80838D)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Image.asset('assets/icons/watch_grey.png'),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        data.startTime.toString() + ' -',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff80838D)),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        data.endTime.toString(),
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff80838D)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icons/dollericon.png'),
                          const SizedBox(
                            width: 4,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                    text: 'Pay Rate: ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff80838D))),
                                TextSpan(
                                  text: '\$' + data.payRate.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff4169DD)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(data.clientName.toString(),
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff80838D)))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildRow(String imageAsset, String name, double score) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //     child: Column(
  //       children: <Widget>[
  //         Container(height: 1, color: Color(0xff9aa1b8)),
  //         SizedBox(height: 12),
  //         Row(
  //           children: <Widget>[
  //             CircleAvatar(
  //               radius: 24,
  //               backgroundColor: Color(0xfff0f3fc),
  //               child: Image.asset(data.profileImage.toString(),color: Color(0xff9aa1b8),height: 24,),
  //             ),
  //             SizedBox(width: 12),
  //             Text(name),
  //             Spacer(),
  //             Container(
  //               decoration: BoxDecoration(color: Colors.yellow[900], borderRadius: BorderRadius.circular(20)),
  //               padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
  //               child: Text('$score'),
  //             ),
  //           ],
  //         ),
  //         SizedBox(height: 12),
  //       ],
  //     ),
  //   );
  // }
}
