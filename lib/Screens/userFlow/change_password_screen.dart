import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sabre_security_app/utils/ApiConstant.dart';
import 'package:sabre_security_app/widgets/common_button.dart';
import 'package:sabre_security_app/widgets/common_password_validator.dart';

import '../../repository/repo_change_password.dart';
import '../../widgets/common_formfields.dart';

const primaryColor = Color(0xFFFFFFFF);

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreen();
}

class _ChangePasswordScreen extends State<ChangePasswordScreen> {
  var _oldPasswordController = TextEditingController();
  var _newPasswordController = TextEditingController();
  var _confirmPasswordController = TextEditingController();

  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width * 0.60;
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(4),
                height: 40,
                margin: const EdgeInsets.all(8),
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.3, color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: Colors.grey,
                  ),
                  //tooltip: 'Increase volume by 10',
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/img_change_pass.png'),
                        fit: BoxFit.contain)),
                // child: Icon(Icons.mail),
                height: 250,
                width: MediaQuery.of(context).size.width,
                // width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Change Your Password",
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // Text(
                  //   "Please enter the 4 Digital code sent to your mailto:email@example.com",
                  //   textAlign: TextAlign.left,
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.w400,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Old Password",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  CommonPasswordFieldWidget(
                    controller: _oldPasswordController,
                    suffix: const Icon(Icons.lock_outline_rounded),
                    hint: "Enter your password",
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'password is required'),
                      MaxLengthValidator(16,
                          errorText: 'Password contains maximum 16 characters'),
                      MinLengthValidator(8,
                          errorText: 'Password contains minimum 8 characters '),
                      PatternValidator(
                          r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$",
                          errorText:
                              'Passwords must contains 1 upper case Letter \n 1 lower case Letter and 1 digit and \n 1 special character'),
                    ]),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "New Password",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  CommonPasswordFieldWidget(
                    suffix: const Icon(Icons.lock_outline_rounded),
                    controller: _newPasswordController,
                    hint: "Enter new password",
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'password is required'),
                      MaxLengthValidator(16,
                          errorText: 'Password contains maximum 16 characters'),
                      MinLengthValidator(8,
                          errorText: 'Password contains minimum 8 characters '),
                      PatternValidator(
                          r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$",
                          errorText:
                              'Passwords must contains 1 upper case Letter \n 1 lower case Letter and 1 digit and \n 1 special character'),
                    ]),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Confirm New Password",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  CommonPasswordFieldWidget(
                      suffix: const Icon(Icons.lock_outline_rounded),
                      controller: _confirmPasswordController,
                      hint: "Enter Confirm password",
                      validator: (val) {
                        if (val!.isEmpty) return 'Empty';
                        if (val != _newPasswordController.text)
                          return ' password Not Match';
                        return null;
                      }),
                  const SizedBox(
                    height: 40,
                  ),

                  Container(
                    alignment: Alignment.bottomCenter,
                    child: CommonButton('Update Password', () {
                      if (_formKey.currentState!.validate()) {
                        // if (_newPasswordController.text.length >= 8) {
                        //   Fluttertoast.showToast(
                        //     msg: "Password must be in proper legnth", // message
                        //     toastLength: Toast.LENGTH_SHORT, // length
                        //     gravity: ToastGravity.BOTTOM, // location
                        //     // duration
                        //
                        if (_newPasswordController.text ==
                            _confirmPasswordController.text) {
                          getChangePassword(
                                  context,
                                  _oldPasswordController.text.toString(),
                                  _newPasswordController.text.toString(),
                                  _confirmPasswordController.text.toString())
                              .then((value) {
                            showToast(value.message);
                            print("==========::::::::change password method");
                            if (value.status!) {
                              print(":::::::::::::====>>>>>>>${value.message}");
                              // Fluttertoast.showToast(
                              //   msg: value.message.toString(), // message
                              //   toastLength: Toast.LENGTH_SHORT, // length
                              //   gravity: ToastGravity.BOTTOM, // location
                              //   // duration
                              // );
                              _oldPasswordController.clear();
                              _newPasswordController.clear();
                              _confirmPasswordController.clear();
                              Get.back();
                            } else {
                              print(":::::::::::::====>>>>>>>${value.message}");
                              // Fluttertoast.showToast(
                              //   msg: value.message.toString(), // message
                              //   toastLength: Toast.LENGTH_SHORT, // length
                              //   gravity: ToastGravity.BOTTOM, // location
                              //   // duration
                              // );
                            }
                            return null;
                          });
                        }
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
