import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sabre_security_app/widgets/common_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/forgot_password_controller.dart';
import '../../repository/forgot_password_repository.dart';
import '../../router/my_router/my_router.dart';
import '../../utils/ApiConstant.dart';
import '../../widgets/common_formfields.dart';

const primaryColor = Color(0xFFFFFFFF);

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreen();
}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  ForgotPasswordController controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width * 0.60;
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, top: 30),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                    )),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/img_change_pass.png'),
                        fit: BoxFit.contain)),
                // child: Icon(Icons.mail),
                height: 250,
                width: MediaQuery.of(context).size.width,
                // width: MediaQuery.of(context).size.width,
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Forgot Password",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Don’t worry! It happens. Please enter the address associated with your account.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Text(
                    "Email Address",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  CommonTextFieldWidget(
                    suffix: Icon(Icons.mail_outline),
                    hint: "Enter your email",
                    controller: controller.email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Filed is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  // SizedBox(
                  //   height: 25,
                  // ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "Email Address",
                  //       textAlign: TextAlign.left,
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // CommonTextFieldWidget(
                  //   controller: emailController,
                  //   suffixIcon: Icon(Icons.email),
                  //   hint: "Enter your email",
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return 'Please enter some text';
                  //     }
                  //     return null;
                  //   },
                  // ),

                  // OtpTextField(
                  //   numberOfFields: 4,
                  //   borderColor: Color(0xFFFFFFFF),
                  //   //set to true to show as box or false to show as dash
                  //   showFieldAsBox: true,
                  //   //runs when a code is typed in
                  //   onCodeChanged: (String code) {
                  //     //handle validation or checks here
                  //   },
                  //   //runs when every textfield is filled
                  //   onSubmit: (String verificationCode) {
                  //     showDialog(
                  //         context: context,
                  //         builder: (context) {
                  //           return AlertDialog(
                  //             title: Text("Verification Code"),
                  //             content:
                  //             Text('Code entered is $verificationCode'),
                  //           );
                  //         });
                  //   }, // end onSubmit
                  // ),
                  //
                  // SizedBox(
                  //   height: 50,
                  // ),
                  //
                  // Text(
                  //   "Resend Code",
                  //   style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF4169dd),decoration: TextDecoration.underline,),
                  // ),
                  // SizedBox(
                  //   height: 34,
                  // ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: CommonButton('Submit', () async {
                      //controller.tabController.animateTo(1);
                      if (_formKey.currentState!.validate()) {
                        controller.email.text;
                        // Get.toNamed(MyRouter.verifyForgotPassword);
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        var userId = pref.getString('userId');
                        print(userId);
                        print(userId);
                        forgotpassword(context, controller.email.text)
                            .then((value) {
                          print(jsonEncode(value));
                          showToast1(value.message);
                          if (value.status!) {
                            Get.toNamed(MyRouter.verifyForgotPassword,
                                arguments: [value, controller.email.text]);
                          }
                        });
                      }
                    }, deviceWidth),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
