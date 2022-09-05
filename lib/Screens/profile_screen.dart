import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sabre_security_app/resources/theme/app_theme.dart';

import '../controllers/profile_controller.dart';
import '../controllers/registration_controller.dart';
import '../widgets/common_widget_button.dart';

class ProfileScreen extends StatefulWidget {
  final bool? showOwnAppBar;

  const ProfileScreen({Key? key, this.showOwnAppBar}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _profileController = Get.put(ProfileController());
  RegistrationController controller = Get.put(RegistrationController());
  final dateFormate = DateFormat.yMMMMd('en_US');

  @override
  void initState() {
    super.initState();
    _profileController.getData();
    controller.dateInput1.text = "";
    controller.getStateData();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: widget.showOwnAppBar == true
          ? CustomIcon('Profile', () {
              // Get.back();
            })
          : null,
      body: SingleChildScrollView(child: SafeArea(
        child: Obx(() {
          return _profileController.isDataLoading.value
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.primaryColor.withOpacity(.8),
                                image: DecorationImage(
                                    image: NetworkImage(_profileController
                                        .model.value.data!.profileImage
                                        .toString()),
                                    fit: BoxFit.cover)),
                            height: screenSize.width * 0.30,
                            width: screenSize.width * 0.30,
                          ),
                          Text(
                            _profileController.model.value.data!.name
                                .toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            _profileController.model.value.data!.designation !=
                                    null
                                ? _profileController
                                    .model.value.data!.designation
                                    .toString()
                                : 'Guard',
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              Container(
                                  height: 67,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black12),
                                        padding: const EdgeInsets.all(10),
                                        child: const Icon(
                                          Icons.mail_outline,
                                          size: 18,
                                          color: AppTheme.iconColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Email',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            _profileController
                                                .model.value.data!.email
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                  height: 67,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black12),
                                        padding: const EdgeInsets.all(10),
                                        child: const Icon(
                                          Icons.phone_android_outlined,
                                          size: 18,
                                          color: AppTheme.iconColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Phone Number',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            _profileController
                                                .model.value.data!.phone
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                  height: 67,
                                  width: MediaQuery.of(context).size.width * 17,
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black12),
                                        padding: const EdgeInsets.all(10),
                                        child: const Icon(
                                          Icons.location_on_outlined,
                                          size: 18,
                                          color: AppTheme.iconColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Address',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            _profileController
                                                .model.value.data!.address
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                  height: 67,
                                  width: MediaQuery.of(context).size.width * 17,
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black12),
                                        padding: const EdgeInsets.all(10),
                                        child: const Icon(
                                          Icons.calendar_today_rounded,
                                          size: 18,
                                          color: AppTheme.iconColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Date of Birth',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            // _profileController
                                            //     .model.value.data!.dob
                                            //     .toString(),
                                            dateFormate.format(DateTime.parse(
                                                _profileController
                                                    .model.value.data!.dob
                                                    .toString())),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        }),
      )),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
