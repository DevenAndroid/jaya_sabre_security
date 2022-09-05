import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_utils/file_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sabre_security_app/models/ModelUploadCertificate.dart';
import 'package:sabre_security_app/utils/ApiConstant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/registration_controller.dart';
import '../../resources/theme/app_theme.dart';
import '../../widgets/common_button.dart';
import '../controllers/Upload_certificate_controller.dart';
import '../helper.dart';
import '../repository/delete_upload_certificate.dart';
import '../repository/upload_certificate_repository.dart';
import '../widgets/common_widget_button.dart';

class UploadCertificateScreen extends StatefulWidget {
  const UploadCertificateScreen({Key? key}) : super(key: key);

  @override
  State<UploadCertificateScreen> createState() =>
      _UploadCertificateScreenState();
}

class _UploadCertificateScreenState extends State<UploadCertificateScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  RegistrationController controller = Get.put(RegistrationController());
  bool bsisGuard = true;
  bool bsisFirearms = true;
  bool caCCW = true;
  bool hr218 = true;

  TextEditingController guardCard = TextEditingController();
  TextEditingController firearmsCard = TextEditingController();
  TextEditingController ccwCard = TextEditingController();
  TextEditingController hrCard = TextEditingController();
  TextEditingController anyOtherLicense = TextEditingController();

  List<String> datalist = [
    "CPR",
    "First Aid",
    "Trauma Protection",
    "Advanced First Aid TCCC",
    "Upload Head Shot",
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
          allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'docx', 'doc']);
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
          allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'docx', 'doc']);
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
          allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'docx', 'doc']);
      if (uploadCertificate2 != null) {
        uploadcertificateFileName2 = uploadCertificate2!.files.first.name;
        uploadcertificatePickedFile2 = uploadCertificate2!.files.first;
        uploadcertificateDisplay2 =
            File(uploadcertificatePickedFile2!.path.toString());

        List<int> uploadcertificateImage64 =
            uploadcertificateDisplay2!.readAsBytesSync();
        uploadcertificate12 = base64Encode(uploadcertificateImage64);

        print("Base 64 image===> $uploadcertificate12");

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
          allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'docx', 'doc']);
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

  late final pdfUrl;

  bool downloading = false;
  RxString progress = "0".obs;
  RxString progress1 = "".obs;
  var path = "No Data";

  var _onPressed;

  @override
  void initState() {
    super.initState();
    downloadController.getData();
  }

  GetUploadedCertificate downloadController = Get.put(GetUploadedCertificate());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width * 0.60;
    return Scaffold(
      appBar: CustomIcon('   Upload Certificates', () {
        Get.back();
      }),
      backgroundColor: AppTheme.bodybackground,
      body: Obx(() {
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  downloadController.isDataLoading.value
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:
                              downloadController.model.value.data!.length,
                          itemBuilder: (context, index) {
                            return item(
                                downloadController.model.value.data![index],
                                downloadController.model.value.data!,
                                index);
                          })
                      : SizedBox.shrink(),

                  const SizedBox(
                    height: 10,
                  ),

                  ///1st section
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Guard Card',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(20),
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, bottom: 10),
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
                                            color: AppTheme.uploadfilebox,
                                            image: DecorationImage(
                                                image: FileImage(
                                                    uploadcertificateDisplay!),
                                                fit: BoxFit.contain),
                                            border: Border.all(
                                                width: 2, color: Colors.black)),
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
                                                uploadcertificateDisplay = null;
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                // color:
                                                //     Colors.black.withOpacity(.6),
                                                shape: BoxShape.circle,
                                              ),
                                              padding: const EdgeInsets.all(8),
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
                                          color: AppTheme.iconColor,
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  ///2nd section
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Open Carry Permit',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(20),
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, bottom: 10),
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
                                                width: 2, color: Colors.black)),
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
                                              padding: const EdgeInsets.all(8),
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  ///3rd section
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Baton Certificate',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(20),
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, bottom: 10),
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
                                                width: 2, color: Colors.black)),
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
                                              padding: const EdgeInsets.all(8),
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'ccw permit certificate',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(20),
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, bottom: 10),
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
                                                width: 2, color: Colors.black)),
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
                                              padding: const EdgeInsets.all(8),
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
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  Container(
                    alignment: Alignment.bottomCenter,
                    child: CommonButton('NEXT', () async {
                      if (uploadcertificateDisplay?.path == null &&
                          uploadcertificateDisplay1?.path == null &&
                          uploadcertificateDisplay2?.path == null &&
                          uploadcertificateDisplay3?.path == null) {
                        showToast('Please Upload atleast a document');
                      } else {
                        if (_formKey.currentState!.validate()) {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          var userId = pref.getString('userId');
                          Map<String, String> param = {
                            // "user_id": userId.toString(),
                          };
                          OverlayEntry loader = Helpers.overlayLoader(context);
                          Overlay.of(context)!.insert(loader);
                          await postApiCallMultipart2(
                            param,
                            'guard_card_certificate',
                            'open_carry_permit_certificate',
                            'baton_certificate',
                            'ccw_permit_certificate',
                            uploadcertificateDisplay?.path != null
                                ? File(uploadcertificateDisplay!.path)
                                : "",
                            uploadcertificateDisplay1?.path != null
                                ? File(uploadcertificateDisplay1!.path)
                                : "",

                            uploadcertificateDisplay2?.path != null
                                ? File(uploadcertificateDisplay2!.path)
                                : "",

                            uploadcertificateDisplay3?.path != null
                                ? File(uploadcertificateDisplay3!.path)
                                : "", // File(uploadcertificateDisplay1?.path ?? ""),
                          ).then((value) {
                            Helpers.hideLoader(loader);
                            showToast('Certificates Uploaded Successfully');
                            if (value.status == true) {
                              downloadController.getData();
                              setState(() {
                                uploadcertificatePickedFile = null;
                                uploadcertificateDisplay = null;

                                uploadcertificatePickedFile1 = null;
                                uploadcertificateDisplay1 = null;

                                uploadcertificatePickedFile2 = null;
                                uploadcertificateDisplay2 = null;

                                uploadcertificatePickedFile3 = null;
                                uploadcertificateDisplay3 = null;
                              });
                              // Get.back();
                            }
                          });
                          Helpers.hideLoader(loader);
                        }
                      }
                    }, deviceWidth),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Future<void> downloadFile(downloadLink) async {
    Dio dio = Dio();

    final status = await Permission.storage.request();
    if (status.isGranted) {
      String dirloc = "";
      if (Platform.isAndroid) {
        dirloc = "/sdcard/download/";
      } else {
        dirloc = (await getApplicationDocumentsDirectory()).path;
      }

      try {
        FileUtils.mkdir([dirloc]);
        await dio.download(downloadLink, dirloc + downloadLink.split('/').last,
            onReceiveProgress: (receivedBytes, totalBytes) {
          print('here 1');
          setState(() {
            downloading = true;
            progress.value =
                ((receivedBytes / totalBytes) * 100).toStringAsFixed(0);
            print(progress);
          });
          print('here 2');
        });
      } catch (e) {
        print('catch catch catch');
        print(e);
      }
      setState(() {
        downloading = false;
        progress1.value = "Download Completed.";
        path = dirloc + downloadLink.split('/').last;
        _onPressed = () {
          downloadFile(downloadLink);
        };
      });
      print(downloadLink);
      print(path);

      Get.back();
      OpenFile.open(path);
    } else {
      setState(() {
        progress1.value = "Permission Denied!";
        // _onPressed = () {
        //   downloadFile(downloadLink);
        // };
      });
    }
  }

  Widget item(Data data, List<Data> list, int index) {
    var screenSize = MediaQuery.of(context).size;
    return InkWell(
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Expanded(
                child: Image.asset(
                  'assets/images/pdf.png',
                  height: 50,
                ),
              ),
            ),
            Expanded(
              child: Text(
                data.fileName.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    if (data.url == "") {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('No Data Found')));
                    } else {
                      downloadFile(data.url);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: const Text("Downloading Done"),
                            actions: [
                              Obx(() {
                                return Text(progress.value.toString());
                              }),
                              Obx(() {
                                return Container(
                                  height: 10,
                                  width: MediaQuery.of(context).size.width,
                                  color: AppTheme.primaryColor,
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          100 *
                                          double.parse(
                                              progress.value.toString())),
                                  child: Container(
                                    color: Colors.grey,
                                  ),
                                );
                              })
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Image.asset(
                    'assets/icons/bluedownloading.png',
                    height: 30,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    deleteUploadCertificate(context, data.fileName)
                        .then((value) => {
                              print('Data Deleted from list'),
                              showToast(value.message),
                              if (value.status)
                                {
                                  setState(() {
                                    list.removeAt(index);
                                  }),
                                }
                            });
                  },
                  child: Image.asset(
                    'assets/icons/deleteicon.png',
                    height: 30,
                  ),
                ),
                SizedBox(
                  width: 16,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
