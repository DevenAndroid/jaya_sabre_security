import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sabre_security_app/Screens/userFlow/Bio_page.dart';
import 'package:sabre_security_app/Screens/userFlow/personal_page_screen.dart';

import '../../controllers/registration_controller.dart';
import 'licenses_Screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  RegistrationController controller = Get.put(RegistrationController());

  @override
  void initState() {
    controller.tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    //padding: EdgeInsets.only(right: 5),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 90,
                ),
                const Text(
                  'Register',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  16.0,
                ),
              ),
              child: TabBar(
                controller: controller.tabController,
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color.fromRGBO(142, 142, 142, 1)),
                labelColor: Colors.blue,
                labelPadding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                labelStyle: const TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                indicatorColor: Colors.blue,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.blue, width: 3.0),
                ),
                onTap: (value) {},
                isScrollable: false,
                tabs: const [
                  Tab(
                    text: 'Personal Info',
                  ),
                  Tab(
                    text: 'Licenses',
                  ),
                  Tab(
                    text: 'More Info',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  PersonalScreen(),
                  LicensesScreen(),
                  BioAboutScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
