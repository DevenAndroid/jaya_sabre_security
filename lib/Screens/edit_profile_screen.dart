import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sabre_security_app/resources/theme/app_theme.dart';
import 'package:sabre_security_app/widgets/common_widget_button.dart';

import '../controllers/profile_controller.dart';
import '../helper.dart';
import '../repository/edit_profile_multipart_repository.dart';
import '../router/my_router/my_router.dart';
import '../utils/ApiConstant.dart';
import '../widgets/common_button.dart';
import '../widgets/common_formfields.dart';

// const primaryColor = Color(0xFF12169dd);
enum ImageSourceType { gallery, camera }

class EditProfileScreen extends StatefulWidget {
  final bool? showOwnAppBar;

  const EditProfileScreen({Key? key, this.showOwnAppBar}) : super(key: key);

  final String title = "Edit Profile";

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final ProfileController _profileController = Get.put(ProfileController());

  final ImagePicker _imagePicker = ImagePicker();
  var _image;

  bool isEmailValidate = false;
  bool isMobileValidate = false;

  final _formKey = GlobalKey<FormState>();
  PickedFile? imageFile = null;

  @override
  initState() {
    super.initState();
    _profileController.dobController1.text = _profileController.profileTime;
    _profileController.dobController.text = _profileController.profileTime;
    _profileController.dobController1.text =
        _profileController.dobController.text;
    _profileController.dobController1.text = DateFormat.yMMMMd('en_US')
        .format(DateTime.parse(_profileController.dobController1.text));
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var deviceWidth = MediaQuery.of(context).size.width * 0.55;
    return Scaffold(
      appBar: widget.showOwnAppBar == true
          ? CustomIcon('Edit Profile', () {
              Get.back();
            })
          : null,
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: screenSize.width * 0.35,
                width: screenSize.width * 0.35,
                child: Stack(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(70),
                      elevation: 3,
                      child: Container(
                        height: screenSize.width * 0.30,
                        width: screenSize.width * 0.30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(70)),
                            border: Border.all(
                                color: AppTheme.colorEditFieldBg, width: 2)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(70)),
                          child: (_image?.path == null)
                              ? Image.network(
                                  _profileController
                                      .model.value.data!.profileImage
                                      .toString(),
                                )
                              : Image.file(
                                  File(_image!.path),
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 15,
                        right: 10,
                        child: GestureDetector(
                          onTap: () => showImageOptions(),
                          child: Container(
                            height: 50,
                            width: 40,
                            // backgroundColor: AppTheme.loginLabelColor,
                            // radius: 12,
                            child: CircleAvatar(
                                backgroundColor: AppTheme.primaryColor,
                                radius: 10,
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 16,
                                  color: Colors.white,
                                )),
                          ),
                        ))
                  ],
                ),
              ),
              Text(
                _profileController.model.value.data!.name.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                _profileController.model.value.data!.designation.toString(),
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Email Address*",
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CommonTextFieldWidget(
                      controller: _profileController.emailController,
                      suffix: const Icon(
                        Icons.mail_outline,
                        color: AppTheme.iconColor,
                      ),
                      hint: "enter your Email",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Filed is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text("Phone Number*", textAlign: TextAlign.left),
                    const SizedBox(
                      height: 12,
                    ),
                    CommonTextFieldWidget(
                      controller: _profileController.phoneController,
                      suffix: const Icon(
                        Icons.phone_android_outlined,
                        color: AppTheme.iconColor,
                      ),
                      hint: "enter your phone number",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text("Address*", textAlign: TextAlign.left),
                    const SizedBox(
                      height: 12,
                    ),
                    CommonTextFieldWidget(
                      controller: _profileController.addressController,
                      suffix: const Icon(
                        Icons.location_on,
                        color: AppTheme.iconColor,
                      ),
                      hint: "enter your address",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text("Date of Birth*", textAlign: TextAlign.left),
                    const SizedBox(
                      height: 12,
                    ),
                    // InkWell(
                    //   onTap: () async {
                    //     DateTime? _selectedDate = await showDatePicker(
                    //         context: context,
                    //         initialDate: DateTime.now(),
                    //         firstDate: DateTime(1950),
                    //         //DateTime.now() - not to allow to choose before today.
                    //         lastDate: DateTime(2101));
                    //
                    //     if (_selectedDate != null) {
                    //       // print(_selectedDate);
                    //
                    //       _profileController.dobController.text =
                    //           _selectedDate.toString();
                    //       // print(dateInput11);
                    //       String formattedDate =
                    //           DateFormat.yMMMMd('en_US').format(_selectedDate);
                    //       // print(formattedDate);
                    //       setState(() {
                    //         _profileController.dobController1.text =
                    //             formattedDate; //set output date to TextField value.
                    //       });
                    //     } else {
                    //       print("Date is not selected");
                    //     }
                    //   },
                    //   child: CommonTextFieldWidget(
                    //     hint: "YYYY-MM-DD",
                    //     controller: _profileController.dobController,
                    //     suffix: const Icon(
                    //       Icons.calendar_month,
                    //       color: AppTheme.iconColor,
                    //     ),
                    //   ),
                    // ),
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
                              _profileController.dobController.text =
                                  _selectedDate.toString();
                              // print(dateInput11);
                              String formattedDate = DateFormat.yMMMMd('en_US')
                                  .format(_selectedDate);
                              // print(formattedDate);
                              setState(() {
                                _profileController.dobController1.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                          child: const Icon(Icons.calendar_today_rounded)),
                      hint: 'YYYY-MM-DD',
                      controller: _profileController.dobController1,
                      bgColor: AppTheme.primaryColor,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                    ),
                  ]),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: CommonButton('Save', () async {
                  if (_formKey.currentState!.validate()) {
                    Map<String, String> param = {
                      "email": _profileController.emailController.text,
                      "phone": _profileController.phoneController.text,
                      "address": _profileController.addressController.text,
                      "dob": _profileController.dobController.text,
                    };
                    print(param);
                    OverlayEntry loader = Helpers.overlayLoader(context);
                    Overlay.of(context)!.insert(loader);

                    await editProfileMuiltipart(
                      param,
                      'profile',
                      _image?.path != null ? File(_image?.path ?? "") : "",
                    ).then((value) {
                      Helpers.hideLoader(loader);
                      showToast(value.message);
                      if (value.status == true) {
                        _profileController.getData();
                        Get.back();
                      }
                    });
                    // updateProfileFieldData(
                    //   context,
                    //   _profileController.emailController.text,
                    //   _profileController.phoneController.text,
                    //   _profileController.addressController.text,
                    //   _profileController.dobController.text,
                    //   _image,
                    // ).then((value) {
                    //   showToast(value.message);
                    //   if (value.status == true) {
                    //     _profileController.getData();
                    //     Get.back();
                    //   }
                    // });
                  }
                }, deviceWidth),
              ),
              const SizedBox(
                height: 15,
              ),
              RichText(
                text: TextSpan(
                  text: " ",
                  style: const TextStyle(
                      color: AppTheme.loginLabelColor, fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Change Password',
                        style: const TextStyle(
                          color: AppTheme.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap =
                              () => Get.toNamed(MyRouter.changePasswordScreen)),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      )),
    );
  }

  showImageOptions() {
    showModalBottomSheet(
        context: context,
        builder: (context) => SizedBox(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Select Type",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.normal),
                    ),
                    TextButton(
                      onPressed: () {
                        _PickImage(context, ImageSourceType.camera);
                      },
                      child: const Text(
                        'Camera',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _PickImage(context, ImageSourceType.gallery);
                      },
                      child: const Text(
                        'Gallery',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  void _PickImage(BuildContext context, var type) async {
    var source = type == ImageSourceType.camera
        ? ImageSource.camera
        : ImageSource.gallery;
    XFile? image = await _imagePicker.pickImage(
        source: source,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);
    setState(() {
      _image = File(image?.path ?? "");
      Navigator.of(context).pop();
    });
  }
}
