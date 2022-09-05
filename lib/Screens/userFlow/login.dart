import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sabre_security_app/utils/ApiConstant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/user_login_repository.dart';
import '../../resources/theme/app_theme.dart';
import '../../router/my_router/my_router.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_formfields.dart';
import '../../widgets/common_password_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool valuefirst = false;
  bool _passwordVisible = true;

  RxBool isPasswordShow1 = true.obs;
  bool? isPassword = true;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool eyeHide = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var deviceWidth = MediaQuery.of(context).size.width * 0.65;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Container(
                height: screenSize.height * 0.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/backcover.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 80,
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 100,
                  width: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Logo.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(
                height: screenSize.height * 0.8,
                margin: const EdgeInsets.only(top: 280),
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    //  bottomRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0),
                    //bottomLeft: Radius.circular(40.0)
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Log In',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Email Address'),
                          // addHeight(8),
                          const SizedBox(
                            height: 20,
                          ),
                          CommonTextFieldWidget(
                            hint: 'Email address',
                            controller: email,
                            suffix: const Icon(
                              Icons.mail_outline,
                              color: Colors.black38,
                            ),
                            bgColor: Colors.white,
                            isPassword: false,
                            validator: MultiValidator([
                              RequiredValidator(errorText: 'Email is required'),
                              EmailValidator(
                                  errorText: 'Enter a valid email address'),
                            ]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text('Password'),
                          //  addHeight(8)
                          const SizedBox(
                            height: 20,
                          ),
                          CommonPasswordFieldWidget(
                            hint: 'Password',
                            obscureText: _passwordVisible,
                            controller: password,
                            textInputAction: TextInputAction.next,
                            //isPassword: true,
                            bgColor: AppTheme.primaryColor,
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'password is required'),
                              MinLengthValidator(8,
                                  errorText:
                                      'password must be at least 8 digits long'),
                              // PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                              //     errorText:
                              //         'Passwords must have at least one special character')
                            ]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(MyRouter.forgotPasswordScreen);
                                },
                                child: const Text(
                                  "Forgot Password",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.primaryColor,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      decorationThickness: 2,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CommonButton('Log In', () async {
                      String? fcmToken =
                          await FirebaseMessaging.instance.getToken();
                      print('fcmToken' + fcmToken.toString());

                      if (_formKey.currentState!.validate()) {
                        createLogin(
                                email.text.toString(),
                                password.text.toString(),
                                fcmToken.toString(),
                                context)
                            .then((value) async {
                          showToast(value.message);
                          if (value.status == true) {
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            pref.setString('user', jsonEncode(value));
                            Get.offAndToNamed(MyRouter.bottomNavbarScreen);
                          }
                          return;
                        });
                      }
                    }, deviceWidth),
                    const SizedBox(
                      height: 30,
                    ),
                    RichText(
                      text: TextSpan(
                        text: " Don’t have an account? ",
                        style: const TextStyle(
                            color: AppTheme.loginLabelColor, fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Register',
                              style: const TextStyle(
                                  color: AppTheme.primaryColor,
                                  decorationStyle: TextDecorationStyle.solid,
                                  decorationThickness: 2,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap =
                                    () => Get.toNamed(MyRouter.registerScreen)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isPasswordValid(password) {
    bool isPasswordValid(String password) => password.length == 6;
    return isPasswordValid(password);
  }

  void togglePassword() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }
}
