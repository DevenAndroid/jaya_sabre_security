import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:sabre_security_app/widgets/common_password_validator.dart';

import '../../repository/reset_forgot_password_repository.dart';
import '../../router/my_router/my_router.dart';
import '../../utils/ApiConstant.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_formfields.dart';

const primaryColor = Color(0xFFFFFFFF);

class ForgotNewPassword extends StatefulWidget {
  const ForgotNewPassword({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ForgotNewPassword> createState() => _ForgotNewPassword();
}

class _ForgotNewPassword extends State<ForgotNewPassword> {
  TextEditingController _pass = TextEditingController();
  TextEditingController _confirmPass = TextEditingController();

  bool obscure1 = true;
  bool obscure2 = true;
  final _formKey = GlobalKey<FormState>();
  var email;

  @override
  void initState() {
    super.initState();
    email = Get.arguments[0];
  }
  //ForgotPasswordController controller = Get.put(ForgotPasswordController());

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
                margin: EdgeInsets.only(top: 20.0),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 22,
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
                    image: DecorationImage(
                        image: AssetImage('assets/images/img_change_pass.png'),
                        fit: BoxFit.contain)),
                // child: Icon(Icons.mail),
                height: 200,
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
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Create a strong password and must remember it for next time login",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 16,
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
                    controller: _pass,
                    hint: "Enter new password",
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'password is required'),
                      MaxLengthValidator(16,
                          errorText:
                              'Password contains maximum 16 characters '),
                      MinLengthValidator(8,
                          errorText: 'Password contains minimum 8 characters '),
                      PatternValidator(
                          r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,10}$",
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
                  CommonTextFieldWidget(
                      suffix: const Icon(Icons.lock_outline_rounded),
                      controller: _confirmPass,
                      hint: "Enter Confirm password",
                      validator: (val) {
                        if (val!.isEmpty) return 'Empty';
                        if (val != _pass.text) return ' password Not Match';
                        return null;
                      }),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: CommonButton('Save Password', () {
                      if (_formKey.currentState!.validate()) {
                        if (_pass.text.length >= 10) {
                          Fluttertoast.showToast(
                            msg: "Password must be in proper legnth", // message
                            toastLength: Toast.LENGTH_SHORT, // length
                            gravity: ToastGravity.BOTTOM, // location
                            // duration
                          );
                        } else if (_pass.text == _confirmPass.text) {
                          showToast("successes");
                          resetForgotPassword(Get.arguments[0].toString(),
                                  _pass.text, _confirmPass.text, context)
                              .then((value) {
                            showToast(value.message);
                            if (value.status!) {
                              Get.offAllNamed(MyRouter.loginScreen);
                              _pass.clear();
                              _confirmPass.clear();
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
