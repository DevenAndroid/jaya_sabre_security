import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabre_security_app/controllers/contact_info_controller.dart';
import 'package:sabre_security_app/controllers/profile_controller.dart';
import 'package:sabre_security_app/resources/theme/app_theme.dart';
import 'package:sabre_security_app/widgets/common_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/ModelHomeData.dart';
import '../repository/get_applyjob_repository.dart';
import '../router/my_router/my_router.dart';
import '../widgets/common_button.dart';
import 'assignment_screen.dart';
import 'availability_screen.dart';
import 'homescreen.dart';
import 'profile_screen.dart';

class BottomNavigation extends StatefulWidget {
  int index;
  BottomNavigation({Key? key, this.index = 0}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final Controller = Get.put(ContactInfoController());
  final _profileController = Get.put(ProfileController());

  int pageIndex = 0;

  RxString title = 'Home'.obs;
  final pages = [
    const HomeScreen(),
    const AssignmentScreen(
      showOwnAppBar: false,
    ),
    const AvailabilityScreen(showOwnAppBar: false),
    const ProfileScreen(
      showOwnAppBar: false,
    )
  ];

  //ModelHomeJobsData item = Get.arguments[0];

  @override
  void initState() {
    super.initState();
    _profileController.getData();
    setState(() {
      pageIndex = widget.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width * 0.60;
    return Obx(() {
      return Controller.dataLoaded.value == false
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              drawer: Drawer(
                child: SafeArea(
                  child: Container(
                    //height: 700,
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width * 17,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(_profileController
                                                  .isDataLoading.value
                                              ? _profileController.model.value
                                                  .data!.profileImage
                                                  .toString()
                                              : ''),
                                          fit: BoxFit.cover)),
                                  height: 66,
                                  width: 66,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),
                                    Text(
                                      _profileController.isDataLoading.value
                                          ? _profileController
                                              .model.value.data!.name
                                              .toString()
                                          : 'John Smith',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      _profileController.model.value.data!
                                                  .designation !=
                                              null
                                          ? _profileController
                                              .model.value.data!.designation
                                              .toString()
                                          : 'Guard',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                              ],
                            )),
                        const Divider(
                          endIndent: 1,
                          indent: 1,
                          thickness: 1,
                        ),
                        Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            commonListTile(
                                Image.asset(
                                  'assets/icons/watch_grey.png',
                                  color: AppTheme.iconColor,
                                ),
                                ' My Availability', () {
                              // setState(() {
                              //   pageIndex = 2;
                              // });
                              Get.toNamed(MyRouter.availabilityScreen);
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                            commonListTile(
                                Image.asset(
                                  'assets/icons/upload_grey.png',
                                  color: AppTheme.iconColor,
                                ),
                                ' Upload Expense', () {
                              Get.toNamed(MyRouter.uploadExpenses);
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                            commonListTile(
                                Image.asset(
                                  'assets/icons/subscribe_grey.png',
                                  color: AppTheme.iconColor,
                                ),
                                ' Certificates Notifications', () {
                              Get.toNamed(MyRouter.subscriptionScreen);
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                            commonListTile(
                                Image.asset(
                                  'assets/icons/archive-book.png',
                                  height: 20,
                                  color: AppTheme.iconColor,
                                ),
                                '  Upload Certificate', () {
                              Get.toNamed(MyRouter.uploadCertificate);
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                            commonListTile(
                                Image.asset(
                                  'assets/icons/message-question.png',
                                  height: 25,
                                  color: AppTheme.iconColor,
                                ),
                                'Sop', () {
                              Get.toNamed(MyRouter.faqScreen);
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                            commonListTile(
                                Image.asset(
                                  'assets/icons/img_assigment.png',
                                  color: AppTheme.iconColor,
                                ),
                                '  My Assignments', () {
                              // setState(() {
                              //   pageIndex = 1;
                              // });
                              Get.toNamed(MyRouter.assignmentScreen);
                              // Get.to(() => BottomNavigation(index:2));
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                            commonListTile(
                                Image.asset(
                                  'assets/icons/boarding-grey.png',
                                  color: AppTheme.iconColor,
                                ),
                                '   On Boarding Documents', () {
                              Get.toNamed(MyRouter.onBoardingScreen);
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                            // commonListTile( Image.asset(
                            //   'assets/icons/user-square.png',
                            //   height: 25,
                            //   color: Colors.grey,
                            // ) , 'Contact Info' , (){
                            //   ExpansionTile(
                            //     title: const Text('Contact Info',
                            //         style: TextStyle(fontSize: 18)),
                            //     children: [
                            //       Container(
                            //         padding: EdgeInsets.all(20),
                            //         decoration: BoxDecoration(
                            //           color: Colors.white,
                            //           borderRadius: BorderRadius.circular(12),
                            //         ),
                            //         child: Column(
                            //           children: [
                            //             Row(
                            //               children: const [
                            //                 SizedBox(
                            //                   width: 10,
                            //                 ),
                            //                 Icon(Icons.mail_outline ,
                            //                   size: 20,
                            //                   color: Colors.grey,
                            //                 ),
                            //                 SizedBox(
                            //                   width: 30,
                            //                 ),
                            //                 Text( 'info@gmail.com',
                            //                   style: TextStyle(
                            //                     fontSize: 18,
                            //                     color: Colors.black87,
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //             SizedBox(
                            //               height: 10,
                            //             ),
                            //             const Divider(
                            //               endIndent: 1,
                            //               indent: 1,
                            //               thickness: 1,
                            //             ),
                            //             SizedBox(
                            //               height: 10,
                            //             ),
                            //             Row(
                            //               children: const [
                            //                 SizedBox(
                            //                   width: 10,
                            //                 ),
                            //                 Icon(Icons.phone_android_outlined,
                            //                   size: 20,
                            //                   color: Colors.grey,
                            //                 ),
                            //                 SizedBox(
                            //                   width: 30,
                            //                 ),
                            //                 Text( '(123) 456 789 012',
                            //                   style: TextStyle(
                            //                     fontSize: 18,
                            //                     color: Colors.black87,
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ],
                            //   );
                            // }),
                            ExpansionTile(
                              // trailing: Icon(Icons.person_outline),
                              // controlAffinity: ListTileControlAffinity.trailing,
                              title: const Text('Contact Info',
                                  style: TextStyle(fontSize: 16)),
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: AppTheme.bodybackground,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Icon(
                                            Icons.mail_outline,
                                            size: 20,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _launchURL();
                                            },
                                            child: Text(
                                              Controller.contactInfoModel.value
                                                  .data!.email
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: AppTheme.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Divider(
                                        endIndent: 1,
                                        indent: 1,
                                        thickness: 1,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Icon(
                                            Icons.phone_android_outlined,
                                            size: 20,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _launchCaller();
                                            },
                                            child: Text(
                                              Controller.contactInfoModel.value
                                                  .data!.phone
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: AppTheme.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: CommonButton('Log Out', () async {
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            pref.clear();
                            Get.offAllNamed(MyRouter.loginScreen);
                            //  }
                          }, deviceWidth),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              appBar: homeAppBar(title.value, () {}),
              body: pages.elementAt(pageIndex),
              extendBody: true,
              backgroundColor: const Color(0xffE9E9E9),
              bottomNavigationBar: buildMyNavBar(context),
            );
    });
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: const BoxDecoration(
        // color: Theme.of(context).primaryColor,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                pageIndex = 0;
                title.value = 'Home';
              });
            },
            child: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  pageIndex == 0
                      ? Image.asset(
                          'assets/icons/home_Blue.png',
                          height: 24,
                        )
                      : Image.asset(
                          'assets/icons/home_Grey.png',
                          height: 24,
                        ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: pageIndex == 0
                            ? const Color(0xff4259DD)
                            : const Color(0xff9AA1B8)),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                pageIndex = 1;
                title.value = 'Assignment';
                // getAppliedJob(context, item.id.toString());
              });
            },
            child: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  pageIndex == 1
                      ? Image.asset(
                          'assets/icons/assignments_Blue.png',
                          height: 24,
                        )
                      : Image.asset(
                          'assets/icons/assignments_Grey.png',
                          height: 24,
                        ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Assignments',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: pageIndex == 1
                            ? const Color(0xff4259DD)
                            : const Color(0xff9AA1B8)),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              pageIndex = 2;
              title.value = 'Availability';
            },
            child: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  pageIndex == 2
                      ? Image.asset(
                          'assets/icons/availability_Blue.png',
                          height: 24,
                        )
                      : Image.asset(
                          'assets/icons/availability_Grey.png',
                          height: 24,
                        ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Availability',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: pageIndex == 2
                            ? const Color(0xff4259DD)
                            : const Color(0xff9AA1B8)),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                pageIndex = 3;
                title.value = 'Profile';
              });
            },
            child: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  pageIndex == 3
                      ? Image.asset(
                          'assets/icons/profile_Blue.png',
                          height: 24,
                        )
                      : Image.asset(
                          'assets/icons/profile_Grey.png',
                          height: 24,
                        ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: pageIndex == 3
                            ? const Color(0xff4259DD)
                            : const Color(0xff9AA1B8)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  commonListTile(Widget icon, String text, GestureTapCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            width: 10,
          ),
          icon,
          const SizedBox(
            width: 30,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  _launchURL() async {
    var uri = Uri.parse("https://support@sabre.com");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // can't launch url
    }
  }

  _launchCaller() async {
    var uri = Uri.parse("tel:+447459860569");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // can't launch url
    }
  }
}
