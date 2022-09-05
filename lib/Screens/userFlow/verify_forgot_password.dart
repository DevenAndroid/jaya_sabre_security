import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../models/ModelForgotPassword.dart';
import '../../repository/forgot_password_repository.dart';
import '../../resources/theme/app_theme.dart';
import '../../router/my_router/my_router.dart';
import '../../utils/ApiConstant.dart';
import '../../widgets/common_button.dart';

const primaryColor = Color(0xFFFFFFFF);

class VerifyForgotPasswordScreen extends StatefulWidget {
  const VerifyForgotPasswordScreen({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<VerifyForgotPasswordScreen> createState() =>
      _VerifyForgotPasswordScreen();
}

class _VerifyForgotPasswordScreen extends State<VerifyForgotPasswordScreen> {
  late Timer _timer;
  int start = 60;
  var resendText = 'Resend OTP';

  TextEditingController otpController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  ModelForgotPassword model = ModelForgotPassword();
  var email = "";

  @override
  initState() {
    super.initState();
    model = Get.arguments[0];
    email = Get.arguments[1];
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var deviceWidth = MediaQuery.of(context).size.width * 0.60;
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topLeft,
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
                margin: EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/images/img_verify_screen.png',
                  // color: Colors.grey,
                  //height: 200,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Verify Your Email",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Please enter the 4 Digital code sent to your email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black54,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 25,
                  ),
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
                  SizedBox(
                    height: 10,
                  ),
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
                  //   fieldWidth: 50,
                  //   fillColor: Colors.white,
                  //   // borderColor: Color(0xFFFFFFFF),
                  //   //set to true to show as box or false to show as dash
                  //   showFieldAsBox: true,
                  //   //runs when a code is typed in
                  //   onCodeChanged: (String code) {
                  //     otpController = code;
                  //     print(otpController);
                  //   },
                  //   //runs when every textfield is filled
                  //   onSubmit: (String verificationCode) {
                  //     otpController = verificationCode;
                  //     print(otpController);
                  //   }, // end onSubmit
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: PinCodeTextField(
                      appContext: context,
                      textStyle: const TextStyle(color: Colors.grey),
                      controller: otpController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "OTP code Required";
                        } else if (v.length != 4) {
                          return "Enter complete OTP code";
                        }
                        return null;
                      },
                      length: 4,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldWidth: 40,
                        fieldHeight: 40,
                        activeColor: Colors.grey,
                        inactiveColor: Colors.grey,
                        errorBorderColor: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (SverificationCode) {
                        setState(() {
                          // otpController =
                          //     verificationCode ;
                          // print(otpController);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: start == 0
                        ? () {
                            forgotpassword(context, email).then((value) {
                              print(jsonEncode(value));
                              showToast1(value.message);
                              if (value.status!) {
                                showToast1("OTP Resend Successfully");
                                model = value;
                                start = 60;
                                startTimer();
                              }
                            });
                          }
                        // : () {
                        //     forgotpassword(context, email).then((value) {
                        //       print(jsonEncode(value));
                        //       showToast1(value.message);
                        //       if (value.status!) {
                        //         showToast1("OTP Resend Successfully");
                        //         model = value;
                        //       }
                        //     });
                        //     startTimer();
                        //   },
                        : null,
                    child: Text(
                      "Resend Code",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: AppTheme.primaryColor,
                          fontSize: 18,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationThickness: 2,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: CommonButton('Verify', () {
                      print(otpController.text);
                      // if (otpController.length < 4) {
                      //   showToast("Enter valid OTP");
                      // } else
                      if (otpController.text != model.data!.otp.toString()) {
                        showToast("Otp not matching");
                      } else if (otpController.text ==
                          model.data!.otp.toString()) {
                        print("user ID ${Get.arguments[1]}");
                        Get.offAllNamed(MyRouter.forgotNewPassword,
                            arguments: [Get.arguments[1]]);
                      }
                    }, deviceWidth),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Resend otp again In ',
                            style: TextStyle(
                                fontSize: 18,
                                color: AppTheme.primaryColor,
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                            text: "00:$start",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        TextSpan(
                            text: " Sec",
                            style: TextStyle(
                                fontSize: 18,
                                color: AppTheme.primaryColor,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 5);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          setState(() {
            resendText == 'Resend';
            timer.cancel();
          });
        } else {
          setState(() {
            resendText = 'Resend OTP $start';
            start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  // void startTimer() {
  //   const oneSec = Duration(seconds: 50);
  //   Timer timer = Timer.periodic(oneSec, (timer) {
  //     if (start == 0) {
  //       setState() {
  //         timer.cancel();
  //       }
  //     } else {
  //       setState() {
  //         start--;
  //       }
  //     }
  //   });
  // }
}
