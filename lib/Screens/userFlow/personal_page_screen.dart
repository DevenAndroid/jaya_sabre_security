import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:sabre_security_app/models/ModelGetStates.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controllers/registration_controller.dart';
import '../../repository/register_stepOne_repository.dart';
import '../../resources/theme/app_theme.dart';

import '../../widgets/common_button.dart';
import '../../widgets/common_formfields.dart';
import '../../widgets/common_password_validator.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({Key? key}) : super(key: key);

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RegistrationController controller = Get.put(RegistrationController());

  List gender = ["Male", "Female", "Other"];
  String? selectedGender;

  bool _passwordVisible = true;

  // ModelStateData? stateValue;
  String? stateValue;
  final String _selectedDate = 'Tap to select date';

  String dateInput11 = "";

  @override
  void initState() {
    controller.dateInput1.text = "";
    super.initState();
    controller.getStateData();
  }

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width * 0.60;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(() {
        return controller.isDataLoading.value
            ? SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    // height: MediaQuery.of(context).size.height*1.5,
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        const Text(
                          'Full Name*',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CommonTextFieldWidget(
                          suffix: const Icon(Icons.person_outline),
                          hint: 'Full name',
                          controller: controller.fullName1,
                          textInputAction: TextInputAction.next,
                          bgColor: AppTheme.primaryColor,
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Full Name is required'),
                            PatternValidator(r'[a-zA-Z]',
                                errorText: 'Please Enter valid Phone number')
                          ]),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Email*',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CommonTextFieldWidget(
                          suffix: const Icon(Icons.mail_outline),
                          hint: 'Email address',
                          controller: controller.email1,
                          bgColor: AppTheme.primaryColor,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          isPassword: false,
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Email is required'),
                            EmailValidator(
                                errorText: 'Enter a valid email address'),
                          ]),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Password*',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CommonPasswordFieldWidget(
                          hint: 'Password',
                          obscureText: _passwordVisible,
                          controller: controller.password1,
                          textInputAction: TextInputAction.next,
                          //isPassword: true,
                          bgColor: AppTheme.primaryColor,
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'password is required'),
                            MaxLengthValidator(16,
                                errorText:
                                    'Password contains maximum 16 characters'),
                            MinLengthValidator(8,
                                errorText:
                                    'Password contains minimum 8 characters '),
                            PatternValidator(
                                r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$",
                                errorText:
                                    'Passwords must contains 1 upper case Letter \n 1 lower case Letter and 1 digit and \n 1 special character'),
                          ]),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Phone*',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CommonTextFieldWidget(
                          suffix: const Icon(Icons.phone_android_sharp),
                          hint: 'Phone',
                          controller: controller.phone1,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          bgColor: AppTheme.primaryColor,
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Phone Number  is required'),
                            MinLengthValidator(10,
                                errorText:
                                    'Phone Number must be at least 10 digits long'),
                            PatternValidator(r'(^(?:[+0]9)?[0-9]{10,12}$)',
                                errorText: 'Please Enter valid Phone number')
                          ]),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Date of Birth*',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CommonTextFieldWidget(
                          suffix: InkWell(
                              onTap: () async {
                                DateTime? _selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101));

                                if (_selectedDate != null) {
                                  // print(_selectedDate);
                                  dateInput11 = _selectedDate.toString();
                                  print(dateInput11);
                                  String formattedDate =
                                      DateFormat.yMMMMd('en_US')
                                          .format(_selectedDate);
                                  // print(formattedDate);
                                  setState(() {
                                    controller.dateInput1.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
                              child: const Icon(Icons.calendar_today_rounded)),
                          hint: 'YYYY-MM-DD',
                          controller: controller.dateInput1,
                          bgColor: AppTheme.primaryColor,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Address*',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CommonTextFieldWidget(
                          suffix: const Icon(Icons.location_on_outlined),
                          hint: 'Address',
                          controller: controller.address1,
                          bgColor: AppTheme.primaryColor,
                          textInputAction: TextInputAction.next,
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Address is required'),
                            //PatternValidator(r'^[a-zA-Z0-9]+$', errorText: 'Enter vaild Address'),
                          ]),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'City*',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CommonTextFieldWidget(
                          suffix: Image.asset(
                            'assets/icons/city.png',
                            color: Colors.black54,
                          ),
                          hint: 'City',
                          controller: controller.city1,
                          textInputAction: TextInputAction.next,
                          bgColor: AppTheme.primaryColor,
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'City is required'),
                            //  PatternValidator(r'^[a-zA-Z0-9]+$', errorText: 'city must have only alphabetic')
                          ]),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'US State*',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            hintText: "State",
                            counterText: "",
                            filled: true,
                            focusColor: AppTheme.loginLabelColor,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 18),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppTheme.primaryColor, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          value: stateValue,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
                          // Array list of items
                          items: List.generate(
                              controller.stateDataModel.value.data!.length,
                              (index) => DropdownMenuItem(
                                  value: controller
                                      .stateDataModel.value.data![index].id
                                      .toString(),
                                  child: Text(controller
                                      .stateDataModel.value.data![index].name
                                      .toString()))),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              stateValue = newValue!;
                              print("::::::::::::::::" + stateValue.toString());
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Zip Code*',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CommonTextFieldWidget(
                          hint: 'Zip Code',
                          controller: controller.zipCode1,
                          bgColor: AppTheme.primaryColor,
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Zipcode is required'),
                            // MinLengthValidator(6,
                            //     errorText:
                            //         'Zipcode must be at least 6 digits long'),
                            // PatternValidator( r'^([A-Z]{1,2}\d{1,2}[A-Z]?)\s*(\d[A-Z]{2})$',
                            //     errorText: 'zipcode must have only numbers')
                          ]),
                        ),
                        const SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              ' Gender',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                addRadioButton(0, 'Male'),
                                addRadioButton(1, 'Female'),
                                addRadioButton(2, 'Rather Not Say'),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: CommonButton('NEXT', () {
                            if (selectedGender == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(" Please select Gender")));
                            } else if (_formKey.currentState!.validate()) {
                              getpersonalInfo(
                                      controller.fullName1.text,
                                      controller.email1.text,
                                      controller.password1.text,
                                      controller.phone1.text,
                                      dateInput11,
                                      controller.address1.text,
                                      controller.city1.text,
                                      stateValue.toString(),
                                      controller.zipCode1.text,
                                      selectedGender.toString().toLowerCase(),
                                      context)
                                  .then((value) async {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(value.message)));
                                if (value.status == true) {
                                  // Get.toNamed(MyRouter.licensesScreen,
                                  //     arguments: [controller.email1.text]);

                                  // final DateFormat formatter =
                                  // DateFormat('yyyy-MM-dd');
                                  // controller.dateInput1.text =
                                  //     formatter.format(_selectedDate);
                                  SharedPreferences pref =
                                      await SharedPreferences.getInstance();
                                  pref.setString(
                                      'userId', jsonEncode(value.data!.userId));
                                  var userId = pref.getString('userId');
                                  print('First step $userId');
                                  controller.email1.text.toString();
                                  controller.tabController.animateTo(1);
                                  controller.step1 = true;
                                }
                              });
                            }
                          }, deviceWidth),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : const Center(child: const CircularProgressIndicator());
      }),
    );
  }

  void togglePassword() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio<String>(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              print(value);
              selectedGender = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }
}
