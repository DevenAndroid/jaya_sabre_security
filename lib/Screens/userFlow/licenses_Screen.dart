import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sabre_security_app/repository/multipart_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/registration_controller.dart';
import '../../helper.dart';
import '../../resources/theme/app_theme.dart';
import '../../router/my_router/my_router.dart';
import '../../utils/ApiConstant.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_formfields.dart';

class LicensesScreen extends StatefulWidget {
  const LicensesScreen({Key? key}) : super(key: key);

  @override
  State<LicensesScreen> createState() => _LicensesScreenState();
}

class _LicensesScreenState extends State<LicensesScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  RegistrationController controller = Get.put(RegistrationController());
  bool bsisGuard = true;
  bool bsisFirearms = true;
  bool caCCW = true;
  bool hr218 = true;
  bool headshot = true;

  TextEditingController guardCard = TextEditingController();
  TextEditingController firearmsCard = TextEditingController();
  TextEditingController ccwCard = TextEditingController();
  TextEditingController hrCard = TextEditingController();
  TextEditingController headshotcard = TextEditingController();
  TextEditingController anyOtherLicense = TextEditingController();

  List<String> datalist = [
    "CPR",
    "First Aid",
    "Trauma Protection",
    "Advanced First Aid TCCC",
  ];

  List<String> selectedMedicalTraining = [];

  FilePickerResult? uploadCertificate;
  String? uploadcertificateFileName;
  PlatformFile? uploadcertificatePickedFile;
  bool uploadcertificateLoading = false;
  File? uploadcertificateDisplay;
  String? uploadcertificate1;

  void uploadCertificateFunction() async {
    try {
      setState(() {
        uploadcertificateLoading = true;
      });
      uploadCertificate = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowMultiple: false,
          allowedExtensions: [
            'jpg',
            'jpeg',
            'png',
          ]);
      if (uploadCertificate != null) {
        uploadcertificateFileName = uploadCertificate!.files.first.name;
        uploadcertificatePickedFile = uploadCertificate!.files.first;
        uploadcertificateDisplay =
            File(uploadcertificatePickedFile!.path.toString());

        List<int> uploadcertificateImage64 =
            uploadcertificateDisplay!.readAsBytesSync();
        uploadcertificate1 = base64Encode(uploadcertificateImage64);

        print("BAse 64 image===> $uploadcertificate1");

        if (kDebugMode) {
          print("File name $uploadcertificateFileName");
        }
      }

      setState(() {
        uploadcertificateLoading = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  FilePickerResult? uploadCertificate1;
  String? uploadcertificateFileName1;
  PlatformFile? uploadcertificatePickedFile1;
  bool uploadcertificateLoading1 = false;
  File? uploadcertificateDisplay1;
  String? uploadcertificate11;

  void uploadCertificateFunction1() async {
    try {
      setState(() {
        uploadcertificateLoading1 = true;
      });
      uploadCertificate1 = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowMultiple: false,
          allowedExtensions: [
            'jpg',
            'jpeg',
            'png',
          ]);
      if (uploadCertificate1 != null) {
        uploadcertificateFileName1 = uploadCertificate1!.files.first.name;
        uploadcertificatePickedFile1 = uploadCertificate1!.files.first;
        uploadcertificateDisplay1 =
            File(uploadcertificatePickedFile1!.path.toString());

        List<int> uploadcertificateImage64 =
            uploadcertificateDisplay1!.readAsBytesSync();
        uploadcertificate11 = base64Encode(uploadcertificateImage64);

        print("BAse 64 image===> $uploadcertificate11");

        if (kDebugMode) {
          print("File name $uploadcertificateFileName1");
        }
      }

      setState(() {
        uploadcertificateLoading1 = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  FilePickerResult? uploadCertificate2;
  String? uploadcertificateFileName2;
  PlatformFile? uploadcertificatePickedFile2;
  bool uploadcertificateLoading2 = false;
  File? uploadcertificateDisplay2;
  String? uploadcertificate12;

  void uploadCertificateFunction2() async {
    try {
      setState(() {
        uploadcertificateLoading2 = true;
      });
      uploadCertificate2 = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowMultiple: false,
          allowedExtensions: [
            'jpg',
            'jpeg',
            'png',
          ]);
      if (uploadCertificate2 != null) {
        uploadcertificateFileName2 = uploadCertificate2!.files.first.name;
        uploadcertificatePickedFile2 = uploadCertificate2!.files.first;
        uploadcertificateDisplay2 =
            File(uploadcertificatePickedFile2!.path.toString());

        List<int> uploadcertificateImage64 =
            uploadcertificateDisplay2!.readAsBytesSync();
        uploadcertificate12 = base64Encode(uploadcertificateImage64);

        print("BAse 64 image===> $uploadcertificate12");

        if (kDebugMode) {
          print("File name $uploadcertificateFileName2");
        }
      }

      setState(() {
        uploadcertificateLoading2 = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  FilePickerResult? uploadCertificate3;
  String? uploadcertificateFileName3;
  PlatformFile? uploadcertificatePickedFile3;
  bool uploadcertificateLoading3 = false;
  File? uploadcertificateDisplay3;
  String? uploadcertificate13;

  void uploadCertificateFunction3() async {
    try {
      setState(() {
        uploadcertificateLoading3 = true;
      });
      uploadCertificate3 = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowMultiple: false,
          allowedExtensions: [
            'jpg',
            'jpeg',
            'png',
          ]);
      if (uploadCertificate3 != null) {
        uploadcertificateFileName3 = uploadCertificate3!.files.first.name;
        uploadcertificatePickedFile3 = uploadCertificate3!.files.first;
        uploadcertificateDisplay3 =
            File(uploadcertificatePickedFile3!.path.toString());

        List<int> uploadcertificateImage64 =
            uploadcertificateDisplay3!.readAsBytesSync();
        uploadcertificate13 = base64Encode(uploadcertificateImage64);

        print("BAse 64 image===> $uploadcertificate13");

        if (kDebugMode) {
          print("File name $uploadcertificateFileName3");
        }
      }

      setState(() {
        uploadcertificateLoading3 = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  FilePickerResult? uploadCertificate4;
  String? uploadcertificateFileName4;
  PlatformFile? uploadcertificatePickedFile4;
  bool uploadcertificateLoading4 = false;
  File? uploadcertificateDisplay4;
  String? uploadcertificate14;

  void uploadCertificateFunction4() async {
    try {
      setState(() {
        uploadcertificateLoading4 = true;
      });
      uploadCertificate4 = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowMultiple: false,
          allowedExtensions: [
            'jpg',
            'jpeg',
            'png',
          ]);
      if (uploadCertificate4 != null) {
        uploadcertificateFileName4 = uploadCertificate4!.files.first.name;
        uploadcertificatePickedFile4 = uploadCertificate4!.files.first;
        uploadcertificateDisplay4 =
            File(uploadcertificatePickedFile4!.path.toString());

        List<int> uploadcertificateImage64 =
            uploadcertificateDisplay4!.readAsBytesSync();
        uploadcertificate14 = base64Encode(uploadcertificateImage64);

        print("BAse 64 image===> $uploadcertificate14");

        if (kDebugMode) {
          print("File name $uploadcertificateFileName4");
        }
      }

      setState(() {
        uploadcertificateLoading4 = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  ///Medical trainig certificates
  ///CPR
  FilePickerResult? uploadCertificate5;
  String? uploadcertificateFileName5;
  PlatformFile? uploadcertificatePickedFile5;
  bool uploadcertificateLoading5 = false;
  File? uploadcertificateDisplay5;
  String? uploadcertificate15;

  ///CPR
  void uploadCertificateFunction5() async {
    try {
      setState(() {
        uploadcertificateLoading5 = true;
      });
      uploadCertificate5 = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowMultiple: false,
          allowedExtensions: [
            'jpg',
            'jpeg',
            'png',
          ]);
      if (uploadCertificate5 != null) {
        uploadcertificateFileName5 = uploadCertificate5!.files.first.name;
        uploadcertificatePickedFile5 = uploadCertificate5!.files.first;
        uploadcertificateDisplay5 =
            File(uploadcertificatePickedFile5!.path.toString());

        List<int> uploadcertificateImage64 =
            uploadcertificateDisplay5!.readAsBytesSync();
        uploadcertificate15 = base64Encode(uploadcertificateImage64);

        print("BAse 64 image===> $uploadcertificate15");

        if (kDebugMode) {
          print("File name $uploadcertificateFileName5");
        }
      }

      setState(() {
        uploadcertificateLoading5 = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  ///first aid
  FilePickerResult? uploadCertificate6;
  String? uploadcertificateFileName6;
  PlatformFile? uploadcertificatePickedFile6;
  bool uploadcertificateLoading6 = false;
  File? uploadcertificateDisplay6;
  String? uploadcertificate16;

  ///first aid
  void uploadCertificateFunction6() async {
    try {
      setState(() {
        uploadcertificateLoading6 = true;
      });
      uploadCertificate6 = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowMultiple: false,
          allowedExtensions: [
            'jpg',
            'jpeg',
            'png',
          ]);
      if (uploadCertificate6 != null) {
        uploadcertificateFileName6 = uploadCertificate6!.files.first.name;
        uploadcertificatePickedFile6 = uploadCertificate6!.files.first;
        uploadcertificateDisplay6 =
            File(uploadcertificatePickedFile6!.path.toString());

        List<int> uploadcertificateImage64 =
            uploadcertificateDisplay6!.readAsBytesSync();
        uploadcertificate16 = base64Encode(uploadcertificateImage64);

        print("BAse 64 image===> $uploadcertificate16");

        if (kDebugMode) {
          print("File name $uploadcertificateFileName6");
        }
      }
      setState(() {
        uploadcertificateLoading6 = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  ///trauma
  FilePickerResult? uploadCertificate7;
  String? uploadcertificateFileName7;
  PlatformFile? uploadcertificatePickedFile7;
  bool uploadcertificateLoading7 = false;
  File? uploadcertificateDisplay7;
  String? uploadcertificate17;

  ///trauma
  void uploadCertificateFunction7() async {
    try {
      setState(() {
        uploadcertificateLoading7 = true;
      });
      uploadCertificate7 = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowMultiple: false,
          allowedExtensions: [
            'jpg',
            'jpeg',
            'png',
          ]);
      if (uploadCertificate7 != null) {
        uploadcertificateFileName7 = uploadCertificate7!.files.first.name;
        uploadcertificatePickedFile7 = uploadCertificate7!.files.first;
        uploadcertificateDisplay7 =
            File(uploadcertificatePickedFile7!.path.toString());

        List<int> uploadcertificateImage64 =
            uploadcertificateDisplay7!.readAsBytesSync();
        uploadcertificate17 = base64Encode(uploadcertificateImage64);

        print("BAse 64 image===> $uploadcertificate17");

        if (kDebugMode) {
          print("File name $uploadcertificateFileName7");
        }
      }
      setState(() {
        uploadcertificateLoading7 = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  ///advace first aid
  FilePickerResult? uploadCertificate8;
  String? uploadcertificateFileName8;
  PlatformFile? uploadcertificatePickedFile8;
  bool uploadcertificateLoading8 = false;
  File? uploadcertificateDisplay8;
  String? uploadcertificate18;

  ///trauma
  void uploadCertificateFunction8() async {
    try {
      setState(() {
        uploadcertificateLoading8 = true;
      });
      uploadCertificate8 = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowMultiple: false,
          allowedExtensions: [
            'jpg',
            'jpeg',
            'png',
          ]);
      if (uploadCertificate8 != null) {
        uploadcertificateFileName8 = uploadCertificate8!.files.first.name;
        uploadcertificatePickedFile8 = uploadCertificate8!.files.first;
        uploadcertificateDisplay8 =
            File(uploadcertificatePickedFile8!.path.toString());

        List<int> uploadcertificateImage64 =
            uploadcertificateDisplay8!.readAsBytesSync();
        uploadcertificate18 = base64Encode(uploadcertificateImage64);

        print("BAse 64 image===> $uploadcertificate18");

        if (kDebugMode) {
          print("File name $uploadcertificateFileName8");
        }
      }
      setState(() {
        uploadcertificateLoading8 = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  late AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width * 0.60;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'BSIS Guard Card?',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                // Container(
                //   padding: const EdgeInsets.only(right: 16),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Expanded(
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                //             Transform.scale(
                //               scale: 1.5,
                //               child: Checkbox(
                //                 shape: const CircleBorder(),
                //                 checkColor: Colors.white,
                //                 activeColor: AppTheme.primaryColor,
                //                 value: bsisGuard,
                //                 onChanged: (bool? value) {
                //                   setState(() {
                //                     bsisGuard = true;
                //                     guardCard.text = "";
                //                   });
                //                 },
                //               ),
                //             ),
                //             const Text('Yes'),
                //           ],
                //         ),
                //       ),
                //       Expanded(
                //         child: Row(
                //           children: [
                //             Transform.scale(
                //               scale: 1.5,
                //               child: Checkbox(
                //                 shape: const CircleBorder(),
                //                 checkColor: Colors.white,
                //                 activeColor: AppTheme.primaryColor,
                //                 value: !bsisGuard,
                //                 onChanged: (bool? value) {
                //                   setState(() {
                //                     bsisGuard = false!;
                //                   });
                //                 },
                //               ),
                //             ),
                //             const Text('No'),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 15,
                ),
                bsisGuard == true
                    ? const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Enter BSIS Guard Card Number?',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 15,
                ),
                bsisGuard == true
                    ? CommonTextFieldWidget(
                        hint: 'Enter your card number',
                        controller: guardCard,
                        bgColor: AppTheme.primaryColor,
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'BSIS Guard Card Number is required'),
                          PatternValidator(r'^[a-zA-Z0-9]+$',
                              errorText:
                                  'Address must have only alphabetic and digit')
                        ]),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 10,
                ),
                bsisGuard == true
                    ? DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(20),
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, bottom: 10),
                        color: AppTheme.primaryColor,
                        dashPattern: const [6],
                        strokeWidth: 1,
                        child: uploadcertificateLoading
                            ? const Center(child: CircularProgressIndicator())
                            : InkWell(
                                onTap: () {
                                  uploadCertificateFunction();
                                },
                                child: uploadcertificatePickedFile != null
                                    ? Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: const Color(0xfff4f4f4),
                                                image: DecorationImage(
                                                    image: FileImage(
                                                        uploadcertificateDisplay!),
                                                    fit: BoxFit.contain),
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.black)),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 15),
                                            width: double.maxFinite,
                                            height: 180,
                                            alignment: Alignment.center,
                                            // child: Text(fileName.toString()),
                                          ),
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    uploadcertificatePickedFile =
                                                        null;
                                                    uploadcertificateDisplay =
                                                        null;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(.6),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: const Icon(
                                                    Icons.clear,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )),
                                        ],
                                      )
                                    : Container(
                                        padding: const EdgeInsets.only(top: 10),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        width: double.maxFinite,
                                        height: 150,
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/upload_grey.png',
                                              color: Colors.grey,
                                              height: 30,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text(
                                              'Upload your certificate here',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black54),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                              'Browse',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: AppTheme.primaryColor,
                                                  decorationStyle:
                                                      TextDecorationStyle.solid,
                                                  decorationThickness: 2,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 20,
                ),

                ///2nd section
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'BSIS Exposed Firearms License?',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                shape: const CircleBorder(),
                                checkColor: Colors.white,
                                activeColor: AppTheme.primaryColor,
                                value: bsisFirearms,
                                onChanged: (bool? value) {
                                  setState(() {
                                    bsisFirearms = true!;
                                    firearmsCard.text = "";
                                  });
                                },
                              ),
                            ),
                            const Text('Yes'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                shape: const CircleBorder(),
                                checkColor: Colors.white,
                                activeColor: AppTheme.primaryColor,
                                value: !bsisFirearms,
                                onChanged: (bool? value) {
                                  setState(() {
                                    bsisFirearms = false!;
                                  });
                                },
                              ),
                            ),
                            const Text('No'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                bsisFirearms == true
                    ? const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'If Yes. BSIS Exposed Firearms License Number?',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 15,
                ),
                bsisFirearms == true
                    ? CommonTextFieldWidget(
                        hint: 'Enter Firearms License Number',
                        controller: firearmsCard,
                        bgColor: AppTheme.primaryColor,
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText:
                                  'BSIS Exposed Firearms License Number is required'),
                          PatternValidator(r'^[a-zA-Z0-9]+$',
                              errorText:
                                  'Address must have only alphabetic and digit')
                        ]),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 15,
                ),
                bsisFirearms == true
                    ? DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(20),
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, bottom: 10),
                        color: AppTheme.primaryColor,
                        dashPattern: const [6],
                        strokeWidth: 1,
                        child: uploadcertificateLoading1
                            ? const Center(child: CircularProgressIndicator())
                            : InkWell(
                                onTap: () {
                                  uploadCertificateFunction1();
                                },
                                child: uploadcertificatePickedFile1 != null
                                    ? Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: const Color(0xfff4f4f4),
                                                image: DecorationImage(
                                                    image: FileImage(
                                                        uploadcertificateDisplay1!),
                                                    fit: BoxFit.contain),
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.black)),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 15),
                                            width: double.maxFinite,
                                            height: 180,
                                            alignment: Alignment.center,
                                            // child: Text(fileName.toString()),
                                          ),
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    uploadcertificatePickedFile1 =
                                                        null;
                                                    uploadcertificateDisplay1 =
                                                        null;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(.6),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: const Icon(
                                                    Icons.clear,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )),
                                        ],
                                      )
                                    : Container(
                                        padding: const EdgeInsets.only(top: 10),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        width: double.maxFinite,
                                        height: 150,
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/upload_grey.png',
                                              color: Colors.grey,
                                              height: 30,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text(
                                              'Upload your certificate here',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black54),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                              'Browse',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: AppTheme.primaryColor,
                                                  decorationStyle:
                                                      TextDecorationStyle.solid,
                                                  decorationThickness: 2,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 20,
                ),

                ///3rd section
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'CA CCW?',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                shape: const CircleBorder(),
                                checkColor: Colors.white,
                                activeColor: AppTheme.primaryColor,
                                value: caCCW,
                                onChanged: (bool? value) {
                                  setState(() {
                                    caCCW = true;
                                    ccwCard.text == "";
                                  });
                                },
                              ),
                            ),
                            const Text('Yes'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                shape: const CircleBorder(),
                                checkColor: Colors.white,
                                activeColor: AppTheme.primaryColor,
                                value: !caCCW,
                                onChanged: (bool? value) {
                                  setState(() {
                                    caCCW = false!;
                                  });
                                },
                              ),
                            ),
                            const Text('No'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                caCCW == true
                    ? const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'If Yes. CA CCW Issuing Agency and Number?',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 15,
                ),
                caCCW == true
                    ? CommonTextFieldWidget(
                        hint: 'Enter CA CCW Issuing Number?',
                        controller: ccwCard,
                        bgColor: AppTheme.primaryColor,
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'CA CCW Issuing Number? is required'),
                          PatternValidator(r'^[a-zA-Z0-9]+$',
                              errorText:
                                  'Address must have only alphabetic and digit')
                        ]),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 15,
                ),
                caCCW == true
                    ? DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(20),
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, bottom: 10),
                        color: AppTheme.primaryColor,
                        dashPattern: const [6],
                        strokeWidth: 1,
                        child: uploadcertificateLoading2
                            ? const Center(child: CircularProgressIndicator())
                            : InkWell(
                                onTap: () {
                                  uploadCertificateFunction2();
                                },
                                child: uploadcertificatePickedFile2 != null
                                    ? Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: const Color(0xfff4f4f4),
                                                image: DecorationImage(
                                                    image: FileImage(
                                                        uploadcertificateDisplay2!),
                                                    fit: BoxFit.contain),
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.black)),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 15),
                                            width: double.maxFinite,
                                            height: 180,
                                            alignment: Alignment.center,
                                            // child: Text(fileName.toString()),
                                          ),
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    uploadcertificatePickedFile2 =
                                                        null;
                                                    uploadcertificateDisplay2 =
                                                        null;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(.6),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: const Icon(
                                                    Icons.clear,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )),
                                        ],
                                      )
                                    : Container(
                                        padding: const EdgeInsets.only(top: 10),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        width: double.maxFinite,
                                        height: 150,
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/upload_grey.png',
                                              color: Colors.grey,
                                              height: 30,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text(
                                              'Upload your certificate here',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black54),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                              'Browse',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: AppTheme.primaryColor,
                                                  decorationStyle:
                                                      TextDecorationStyle.solid,
                                                  decorationThickness: 2,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'HR218?',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                shape: const CircleBorder(),
                                checkColor: Colors.white,
                                activeColor: AppTheme.primaryColor,
                                value: hr218,
                                onChanged: (bool? value) {
                                  setState(() {
                                    hr218 = true!;
                                    hrCard.text == "";
                                  });
                                },
                              ),
                            ),
                            const Text('Yes'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                shape: const CircleBorder(),
                                checkColor: Colors.white,
                                activeColor: AppTheme.primaryColor,
                                value: !hr218,
                                onChanged: (bool? value) {
                                  setState(() {
                                    hr218 = false!;
                                  });
                                },
                              ),
                            ),
                            const Text('No'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                hr218 == true
                    ? const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'If Yes. HR218 Issuing Agency?',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 15,
                ),
                hr218 == true
                    ? CommonTextFieldWidget(
                        hint: 'Enter HR218 Issuing Number',
                        controller: hrCard,
                        bgColor: AppTheme.primaryColor,
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'HR218 Issuing Number is required'),
                          PatternValidator(r'^[a-zA-Z0-9]+$',
                              errorText:
                                  'Address must have only alphabetic and digit')
                        ]),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 15,
                ),
                hr218 == true
                    ? DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(20),
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, bottom: 10),
                        color: AppTheme.primaryColor,
                        dashPattern: const [6],
                        strokeWidth: 1,
                        child: uploadcertificateLoading3
                            ? const Center(child: CircularProgressIndicator())
                            : InkWell(
                                onTap: () {
                                  uploadCertificateFunction3();
                                },
                                child: uploadcertificatePickedFile3 != null
                                    ? Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: const Color(0xfff4f4f4),
                                                image: DecorationImage(
                                                    image: FileImage(
                                                        uploadcertificateDisplay3!),
                                                    fit: BoxFit.contain),
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.black)),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 15),
                                            width: double.maxFinite,
                                            height: 180,
                                            alignment: Alignment.center,
                                            // child: Text(fileName.toString()),
                                          ),
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    uploadcertificatePickedFile3 =
                                                        null;
                                                    uploadcertificateDisplay3 =
                                                        null;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(.6),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: const Icon(
                                                    Icons.clear,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )),
                                        ],
                                      )
                                    : Container(
                                        padding: const EdgeInsets.only(top: 10),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        width: double.maxFinite,
                                        height: 150,
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/upload_grey.png',
                                              color: Colors.grey,
                                              height: 30,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text(
                                              'Upload your certificate here',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black54),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                              'Browse',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: AppTheme.primaryColor,
                                                  decorationStyle:
                                                      TextDecorationStyle.solid,
                                                  decorationThickness: 2,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                      )
                    : const SizedBox.shrink(),
                hr218 == true
                    ? const SizedBox(
                        height: 20,
                      )
                    : const SizedBox.shrink(),

                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'HeadShot?',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                shape: const CircleBorder(),
                                checkColor: Colors.white,
                                activeColor: AppTheme.primaryColor,
                                value: headshot,
                                onChanged: (bool? value) {
                                  setState(() {
                                    headshot = true!;
                                    headshotcard.text == "";
                                  });
                                },
                              ),
                            ),
                            const Text('Yes'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                shape: const CircleBorder(),
                                checkColor: Colors.white,
                                activeColor: AppTheme.primaryColor,
                                value: !headshot,
                                onChanged: (bool? value) {
                                  setState(() {
                                    headshot = false!;
                                  });
                                },
                              ),
                            ),
                            const Text('No'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                headshot == true
                    ? const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'If Yes. headshot Issuing Agency?',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      )
                    : const SizedBox.shrink(),

                const SizedBox(
                  height: 15,
                ),
                headshot == true
                    ? CommonTextFieldWidget(
                        hint: 'Enter Headshot Issuing Number',
                        controller: headshotcard,
                        bgColor: AppTheme.primaryColor,
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'Headshot Issuing Number is required'),
                          PatternValidator(r'^[a-zA-Z0-9]+$',
                              errorText:
                                  'Headshot must have only alphabetic and digit')
                        ]),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 15,
                ),
                headshot == true
                    ? DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(20),
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, bottom: 10),
                        color: AppTheme.primaryColor,
                        dashPattern: const [6],
                        strokeWidth: 1,
                        child: uploadcertificateLoading4
                            ? const Center(child: CircularProgressIndicator())
                            : InkWell(
                                onTap: () {
                                  uploadCertificateFunction4();
                                },
                                child: uploadcertificatePickedFile4 != null
                                    ? Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: const Color(0xfff4f4f4),
                                                image: DecorationImage(
                                                    image: FileImage(
                                                        uploadcertificateDisplay4!),
                                                    fit: BoxFit.contain),
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.black)),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 15),
                                            width: double.maxFinite,
                                            height: 180,
                                            alignment: Alignment.center,
                                            // child: Text(fileName.toString()),
                                          ),
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    uploadcertificatePickedFile4 =
                                                        null;
                                                    uploadcertificateDisplay4 =
                                                        null;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(.6),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: const Icon(
                                                    Icons.clear,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )),
                                        ],
                                      )
                                    : Container(
                                        padding: const EdgeInsets.only(top: 10),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        width: double.maxFinite,
                                        height: 150,
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/upload_grey.png',
                                              color: Colors.grey,
                                              height: 30,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text(
                                              'Upload your certificate here',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black54),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                              'Browse',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: AppTheme.primaryColor,
                                                  decorationStyle:
                                                      TextDecorationStyle.solid,
                                                  decorationThickness: 2,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                      )
                    : const SizedBox.shrink(),
                headshot == true
                    ? const SizedBox(
                        height: 20,
                      )
                    : const SizedBox.shrink(),
                SizedBox(
                  height: 20,
                ),

                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Medical Training?',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 190,
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: datalist.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  if (selectedMedicalTraining
                                      .contains(datalist[index].toString())) {
                                    selectedMedicalTraining
                                        .remove(datalist[index].toString());
                                  } else {
                                    selectedMedicalTraining
                                        .add(datalist[index].toString());
                                  }
                                });
                                print(
                                    " my Medical trainings=>>>>  $selectedMedicalTraining");
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(datalist[index].toString()),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(4),
                                    height: 28,
                                    width: 32,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(6))),
                                    child: selectedMedicalTraining.contains(
                                            datalist[index].toString())
                                        ? const Icon(Icons.check,
                                            color: AppTheme.primaryColor)
                                        : null,
                                  )
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                ),

                selectedMedicalTraining.contains(datalist[0].toString()) == true
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'CPR Training',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 10,
                ),
                selectedMedicalTraining.contains(datalist[0].toString()) == true
                    ? DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(20),
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, bottom: 10),
                        color: AppTheme.primaryColor,
                        dashPattern: const [6],
                        strokeWidth: 1,
                        child: uploadcertificateLoading5
                            ? const Center(child: CircularProgressIndicator())
                            : InkWell(
                                onTap: () {
                                  uploadCertificateFunction5();
                                },
                                child: uploadcertificatePickedFile5 != null
                                    ? Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: const Color(0xfff4f4f4),
                                                image: DecorationImage(
                                                    image: FileImage(
                                                        uploadcertificateDisplay5!),
                                                    fit: BoxFit.contain),
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.black)),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 15),
                                            width: double.maxFinite,
                                            height: 180,
                                            alignment: Alignment.center,
                                            // child: Text(fileName.toString()),
                                          ),
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    uploadcertificatePickedFile5 =
                                                        null;
                                                    uploadcertificateDisplay5 =
                                                        null;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(.6),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: const Icon(
                                                    Icons.clear,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )),
                                          SizedBox(height: 20),
                                        ],
                                      )
                                    : Container(
                                        padding: const EdgeInsets.only(top: 10),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        width: double.maxFinite,
                                        height: 150,
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/upload_grey.png',
                                              color: Colors.grey,
                                              height: 30,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text(
                                              'Upload your certificate here',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black54),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                              'Browse',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: AppTheme.primaryColor,
                                                  decorationStyle:
                                                      TextDecorationStyle.solid,
                                                  decorationThickness: 2,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                      )
                    : const SizedBox.shrink(),
                SizedBox(
                  height: 10,
                ),

                selectedMedicalTraining.contains(datalist[1].toString()) == true
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'First Aid Training',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 10,
                ),
                selectedMedicalTraining.contains(datalist[1].toString()) == true
                    ? DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(20),
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, bottom: 10),
                        color: AppTheme.primaryColor,
                        dashPattern: const [6],
                        strokeWidth: 1,
                        child: uploadcertificateLoading6
                            ? const Center(child: CircularProgressIndicator())
                            : InkWell(
                                onTap: () {
                                  uploadCertificateFunction6();
                                },
                                child: uploadcertificatePickedFile6 != null
                                    ? Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: const Color(0xfff4f4f4),
                                                image: DecorationImage(
                                                    image: FileImage(
                                                        uploadcertificateDisplay6!),
                                                    fit: BoxFit.contain),
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.black)),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 15),
                                            width: double.maxFinite,
                                            height: 180,
                                            alignment: Alignment.center,
                                            // child: Text(fileName.toString()),
                                          ),
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    uploadcertificatePickedFile6 =
                                                        null;
                                                    uploadcertificateDisplay6 =
                                                        null;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(.6),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: const Icon(
                                                    Icons.clear,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )),
                                        ],
                                      )
                                    : Container(
                                        padding: const EdgeInsets.only(top: 10),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        width: double.maxFinite,
                                        height: 150,
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/upload_grey.png',
                                              color: Colors.grey,
                                              height: 30,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text(
                                              'Upload your certificate here',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black54),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                              'Browse',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: AppTheme.primaryColor,
                                                  decorationStyle:
                                                      TextDecorationStyle.solid,
                                                  decorationThickness: 2,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                            SizedBox(height: 10),
                                          ],
                                        ),
                                      ),
                              ),
                      )
                    : const SizedBox.shrink(),
                SizedBox(
                  height: 10,
                ),

                selectedMedicalTraining.contains(datalist[2].toString()) == true
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Trauma Protection Training',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 10,
                ),
                selectedMedicalTraining.contains(datalist[2].toString()) == true
                    ? DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(20),
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, bottom: 10),
                        color: AppTheme.primaryColor,
                        dashPattern: const [6],
                        strokeWidth: 1,
                        child: uploadcertificateLoading7
                            ? const Center(child: CircularProgressIndicator())
                            : InkWell(
                                onTap: () {
                                  uploadCertificateFunction7();
                                },
                                child: uploadcertificatePickedFile7 != null
                                    ? Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: const Color(0xfff4f4f4),
                                                image: DecorationImage(
                                                    image: FileImage(
                                                        uploadcertificateDisplay7!),
                                                    fit: BoxFit.contain),
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.black)),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 15),
                                            width: double.maxFinite,
                                            height: 180,
                                            alignment: Alignment.center,
                                            // child: Text(fileName.toString()),
                                          ),
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    uploadcertificatePickedFile7 =
                                                        null;
                                                    uploadcertificateDisplay7 =
                                                        null;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(.6),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: const Icon(
                                                    Icons.clear,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )),
                                        ],
                                      )
                                    : Container(
                                        padding: const EdgeInsets.only(top: 10),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        width: double.maxFinite,
                                        height: 150,
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/upload_grey.png',
                                              color: Colors.grey,
                                              height: 30,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text(
                                              'Upload your certificate here',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black54),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                              'Browse',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: AppTheme.primaryColor,
                                                  decorationStyle:
                                                      TextDecorationStyle.solid,
                                                  decorationThickness: 2,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                      )
                    : const SizedBox.shrink(),
                SizedBox(
                  height: 10,
                ),

                selectedMedicalTraining.contains(datalist[3].toString()) == true
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Advance First Aid TCCC Training',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 10,
                ),
                selectedMedicalTraining.contains(datalist[3].toString()) == true
                    ? DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(20),
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, bottom: 10),
                        color: AppTheme.primaryColor,
                        dashPattern: const [6],
                        strokeWidth: 1,
                        child: uploadcertificateLoading8
                            ? const Center(child: CircularProgressIndicator())
                            : InkWell(
                                onTap: () {
                                  uploadCertificateFunction8();
                                },
                                child: uploadcertificatePickedFile8 != null
                                    ? Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: const Color(0xfff4f4f4),
                                                image: DecorationImage(
                                                    image: FileImage(
                                                        uploadcertificateDisplay8!),
                                                    fit: BoxFit.contain),
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.black)),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 15),
                                            width: double.maxFinite,
                                            height: 180,
                                            alignment: Alignment.center,
                                            // child: Text(fileName.toString()),
                                          ),
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    uploadcertificatePickedFile8 =
                                                        null;
                                                    uploadcertificateDisplay8 =
                                                        null;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(.6),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: const Icon(
                                                    Icons.clear,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )),
                                        ],
                                      )
                                    : Container(
                                        padding: const EdgeInsets.only(top: 10),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        width: double.maxFinite,
                                        height: 150,
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/upload_grey.png',
                                              color: Colors.grey,
                                              height: 30,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text(
                                              'Upload your certificate here',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black54),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                              'Browse',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: AppTheme.primaryColor,
                                                  decorationStyle:
                                                      TextDecorationStyle.solid,
                                                  decorationThickness: 2,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                      )
                    : const SizedBox.shrink(),
                SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Do you have additonal firearms licenses? Please list them all here',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
                  // autovalidateMode: autovalidateMode,
                  // onChanged: (value) {
                  //   if (value != "") {
                  //     autovalidateMode = AutovalidateMode.disabled;
                  //   }
                  // },
                  decoration: const InputDecoration(
                      hintText: "Please List examples?",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  controller: anyOtherLicense,
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: CommonButton('NEXT', () async {
                    FocusManager.instance.primaryFocus!.unfocus();
                    // if (bsisGuard == false) {
                    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //       content: Text(
                    //           "BSIS Guard Card is Required, Please click on yes")));
                    // } else if (guardCard.text == "") {
                    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //       content: Text("BSIS Guard Card Number is Required")));
                    // }
                    // else if (uploadcertificateDisplay?.path == null) {
                    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //       content:
                    //           Text("Please upload BSIS Gurad Card Document")));
                    // }
                    // else if (bsisFirearms == true) {
                    //   if (firearmsCard.text.isEmpty) {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //         const SnackBar(
                    //             content: Text(
                    //                 "BSIS firearmsCard Number is Required")));
                    //   } else if (uploadcertificateDisplay1?.path == null) {
                    //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //         content: Text(
                    //             "Please upload BSIS firearmsCard Document")));
                    //   }
                    // } else if (ccwCard.text != "") {
                    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //       content: Text("Please upload ccwCard Document")));
                    // }
                    // else if (hrCard.text != "") {
                    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //       content: Text("Please upload hrCard Document")));
                    // } else if (headshotcard.text != "") {
                    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //       content:
                    //           Text("Please upload headshotcard Document")));
                    // }
                    // else if (controller.step1 == false) {
                    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //       content: Text("Please Fill personal details First")));
                    // } else if (_formKey.currentState!.validate()) {
                    //   var medicalTrainings = '';
                    //   for (var item in selectedMedicalTraining) {
                    //     if (medicalTrainings == '') {
                    //       medicalTrainings = item;
                    //     } else {
                    //       medicalTrainings = '$medicalTrainings,$item';
                    //     }
                    //   }
                    //   SharedPreferences pref =
                    //       await SharedPreferences.getInstance();
                    //   var userId = pref.getString('userId');
                    //   Map<String, String> param = {
                    //     "user_id": userId!.toString(),
                    //     "guard_card": guardCard.text,
                    //     "guard_card_number": guardCard.text.toString(),
                    //     "firearm_license": bsisFirearms.toString(),
                    //     "fire_lice_number": firearmsCard.text.toString(),
                    //     "ca_ccw": caCCW.toString(),
                    //     "ca_ccw_number": ccwCard.text.toString(),
                    //     "hr_cert": hr218.toString(),
                    //     "hr_agency": hrCard.text.toString(),
                    //     "head_shot": headshot.toString(),
                    //     "head_shot_number": headshotcard.text.toString(),
                    //     "any_other_license": anyOtherLicense.text.toString(),
                    //     "medical_training": medicalTrainings,
                    //   };
                    //   OverlayEntry loader = Helpers.overlayLoader(context);
                    //   Overlay.of(context)!.insert(loader);
                    //   await postApiCallMultipart(
                    //     param,
                    //     'bsis_guard_card_certificate',
                    //     'bsis_exposed_certificate',
                    //     'ca_ccw_certificate',
                    //     'hr_certificate',
                    //     'head_shot_certificate',
                    //     'cpr_certificate',
                    //     'first_aid',
                    //     'trauma_protection',
                    //     'advance_first_aid',
                    //     File(uploadcertificateDisplay?.path ?? ""),
                    //     uploadcertificateDisplay1?.path != null
                    //         ? File(uploadcertificateDisplay1!.path)
                    //         : "",
                    //     uploadcertificateDisplay2?.path != null
                    //         ? File(uploadcertificateDisplay2?.path ?? "")
                    //         : " ",
                    //     uploadcertificateDisplay3?.path != null
                    //         ? File(uploadcertificateDisplay3?.path ?? "")
                    //         : " ",
                    //     uploadcertificateDisplay4?.path != null
                    //         ? File(uploadcertificateDisplay4?.path ?? "")
                    //         : " ",
                    //     uploadcertificateDisplay5?.path != null
                    //         ? File(uploadcertificateDisplay5?.path ?? "")
                    //         : " ",
                    //     uploadcertificateDisplay6?.path != null
                    //         ? File(uploadcertificateDisplay6?.path ?? "")
                    //         : " ",
                    //     uploadcertificateDisplay7?.path != null
                    //         ? File(uploadcertificateDisplay7?.path ?? "")
                    //         : " ",
                    //     uploadcertificateDisplay8?.path != null
                    //         ? File(uploadcertificateDisplay8?.path ?? "")
                    //         : " ",
                    //   ).then((value) {
                    //     Helpers.hideLoader(loader);
                    //     if (value.status == true) {
                    //       controller.tabController.animateTo(2);
                    //       controller.step2 = true;
                    //     }
                    //   });
                    //   Helpers.hideLoader(loader);
                    // }
                    if (controller.step1 == false) {
                      showToast1('Please Fill Personal Details First');
                    } else {
                      if (_formKey.currentState!.validate()) {
                        if (uploadcertificateDisplay?.path == null) {
                          showToast1('Please Upload BSIS Guard card Details');
                        } else {
                          if (bsisFirearms == true &&
                              uploadcertificateDisplay1?.path == null) {
                            showToast1(
                                'Please upload Firearms License Document');
                          } else {
                            if (caCCW == true &&
                                uploadcertificateDisplay2?.path == null) {
                              showToast1('Please upload CA CCW Document');
                            } else {
                              if (hr218 == true &&
                                  uploadcertificateDisplay3?.path == null) {
                                showToast1('Please upload HR218 Document');
                              } else {
                                if (headshot == true &&
                                    uploadcertificateDisplay4?.path == null) {
                                  showToast1('Please upload Headshot Document');
                                } else {
                                  if (selectedMedicalTraining.contains(
                                              datalist[0].toString()) ==
                                          true &&
                                      uploadcertificateDisplay5?.path == null) {
                                    showToast1('Please upload CPR Document');
                                  } else {
                                    if (selectedMedicalTraining.contains(
                                                datalist[1].toString()) ==
                                            true &&
                                        uploadcertificateDisplay6?.path ==
                                            null) {
                                      showToast1(
                                          'Please upload First Aid Document');
                                    } else {
                                      if (selectedMedicalTraining.contains(
                                                  datalist[2].toString()) ==
                                              true &&
                                          uploadcertificateDisplay7?.path ==
                                              null) {
                                        showToast1(
                                            'Please upload Trauma Protection Document');
                                      } else {
                                        if (selectedMedicalTraining.contains(
                                                    datalist[3].toString()) ==
                                                true &&
                                            uploadcertificateDisplay8?.path ==
                                                null) {
                                          showToast1(
                                              'Please upload Advanced First Aid TCCC Document');
                                        } else {
                                          var medicalTrainings = '';
                                          for (var item
                                              in selectedMedicalTraining) {
                                            if (medicalTrainings == '') {
                                              medicalTrainings = item;
                                            } else {
                                              medicalTrainings =
                                                  '$medicalTrainings,$item';
                                            }
                                          }
                                          SharedPreferences pref =
                                              await SharedPreferences
                                                  .getInstance();
                                          var userId = pref.getString('userId');
                                          Map<String, String> param = {
                                            "user_id": userId!.toString(),
                                            "guard_card": guardCard.text,
                                            "guard_card_number":
                                                guardCard.text.toString(),
                                            "firearm_license":
                                                bsisFirearms == true
                                                    ? 'yes'
                                                    : 'no',
                                            "fire_lice_number":
                                                firearmsCard.text.toString(),
                                            "ca_ccw":
                                                caCCW == true ? 'yes' : 'no',
                                            "ca_ccw_number":
                                                ccwCard.text.toString(),
                                            "hr_cert":
                                                hr218 == true ? 'yes' : 'no',
                                            "hr_agency": hrCard.text.toString(),
                                            "head_shot":
                                                headshot == true ? 'yes' : 'no',
                                            "head_shot_number":
                                                headshotcard.text.toString(),
                                            "any_other_license":
                                                anyOtherLicense.text.toString(),
                                            "medical_training":
                                                medicalTrainings,
                                          };
                                          OverlayEntry loader =
                                              Helpers.overlayLoader(context);
                                          Overlay.of(context)!.insert(loader);
                                          await postApiCallMultipart(
                                            param,
                                            'bsis_guard_card_certificate',
                                            'bsis_exposed_certificate',
                                            'ca_ccw_certificate',
                                            'hr_certificate',
                                            'head_shot_certificate',
                                            'cpr_certificate',
                                            'first_aid',
                                            'trauma_protection',
                                            'advance_first_aid',
                                            File(uploadcertificateDisplay
                                                    ?.path ??
                                                ""),
                                            uploadcertificateDisplay1?.path !=
                                                    null
                                                ? File(
                                                    uploadcertificateDisplay1!
                                                        .path)
                                                : "",
                                            uploadcertificateDisplay2?.path !=
                                                    null
                                                ? File(uploadcertificateDisplay2
                                                        ?.path ??
                                                    "")
                                                : " ",
                                            uploadcertificateDisplay3?.path !=
                                                    null
                                                ? File(uploadcertificateDisplay3
                                                        ?.path ??
                                                    "")
                                                : " ",
                                            uploadcertificateDisplay4?.path !=
                                                    null
                                                ? File(uploadcertificateDisplay4
                                                        ?.path ??
                                                    "")
                                                : " ",
                                            uploadcertificateDisplay5?.path !=
                                                    null
                                                ? File(uploadcertificateDisplay5
                                                        ?.path ??
                                                    "")
                                                : " ",
                                            uploadcertificateDisplay6?.path !=
                                                    null
                                                ? File(uploadcertificateDisplay6
                                                        ?.path ??
                                                    "")
                                                : " ",
                                            uploadcertificateDisplay7?.path !=
                                                    null
                                                ? File(uploadcertificateDisplay7
                                                        ?.path ??
                                                    "")
                                                : " ",
                                            uploadcertificateDisplay8?.path !=
                                                    null
                                                ? File(uploadcertificateDisplay8
                                                        ?.path ??
                                                    "")
                                                : " ",
                                          ).then((value) {
                                            Helpers.hideLoader(loader);
                                            if (value.status == true) {
                                              controller.tabController
                                                  .animateTo(2);
                                              controller.step2 = true;
                                            }
                                          });
                                          Helpers.hideLoader(loader);
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }, deviceWidth),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
