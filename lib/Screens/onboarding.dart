import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_utils/file_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sabre_security_app/resources/theme/app_theme.dart';
import 'package:sabre_security_app/utils/ApiConstant.dart';

import '../controllers/getOnBoardingDownloadController.dart';
import '../helper.dart';
import '../repository/get_onboardingUpload_repository.dart';
import '../widgets/common_widget_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool downloading = false;
  RxString progress = "".obs;
  var path = "No Data";
  var platformVersion = "Unknown";

//  File? uploadcertificateDisplay;
  var _onPressed;
  //late Directory externalDir;

  FilePickerResult? uploadcertificate;
  String? uploadcertificateFileName;
  PlatformFile? uploadcertificatePickedFile;
  bool uploadcertificateLoading = false;
  File? uploadcertificateDisplay;
  String? uploadcertificate1;

  void uploadcertificateFunction(String Data, context) async {
    try {
      setState(() {
        uploadcertificateLoading = true;
      });
      uploadcertificate = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowMultiple: false,
          allowedExtensions: [
            'docx',
            'doc',
            'pdf',
            'jpg',
            'jpeg',
            'png',
          ]);
      if (uploadcertificate != null) {
        uploadcertificateFileName = uploadcertificate!.files.first.name;
        uploadcertificatePickedFile = uploadcertificate!.files.first;
        uploadcertificateDisplay =
            File(uploadcertificatePickedFile!.path.toString());
        OverlayEntry loader = Helpers.overlayLoader(context);
        Overlay.of(context)!.insert(loader);
        postApiCallMultipart1(
          Data,
          File(uploadcertificateDisplay?.path ?? ""),
        ).then((value) {
          Helpers.hideLoader(loader);
          showToast(value.message);
          if (value.status == true) {
            DownloadingController.getData();
          }
        });
        //
        //
        // List<int> uploadcertificateImage64 =
        //     uploadcertificateDisplay!.readAsBytesSync();
        // uploadcertificate1 = base64Encode(uploadcertificateImage64);
        //
        // print("BAse 64 image===> " + uploadcertificate1.toString());

        // if (kDebugMode) {
        //   print("File name $uploadcertificateFileName");
        // }
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

  GetOnboardingDownloadController DownloadingController =
      Get.put(GetOnboardingDownloadController());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomIcon('On Boarding', () {
        Get.back();
      }),
      backgroundColor: AppTheme.bodybackground,
      body: SingleChildScrollView(
          child:
              //DownloadingController.isDataLoading.value ?
              Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Instruction',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0, left: 12, right: 12),
            padding: EdgeInsets.all(30),
            height: screenSize.width * 0.5,
            // width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '1. Download document',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black38,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '2. Read the document carefully and signature on it',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black38,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '3. Upload document',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black38,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(12.0),
            child: Card(
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text('Drug & Alcohol Policy'),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  InkWell(
                    onTap: () {
                      uploadcertificateFunction('drug_alcohol', context);
                    },
                    child: Image.asset(
                      'assets/icons/document.png',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (DownloadingController.model.value.data!.drugAlcohol ==
                          null) {
                        showToast('No Data Found');
                      } else {
                        downloadFile(DownloadingController
                            .model.value.data!.drugAlcohol
                            .toString());
                        showToast('Downloading..');
                      }
                    },
                    child: Image.asset(
                      'assets/icons/onboarding.png',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(12.0),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text('Employee Demographics'),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  InkWell(
                    onTap: () {
                      uploadcertificateFunction('emp_demo', context);
                    },
                    child: Image.asset(
                      'assets/icons/document.png',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (DownloadingController.model.value.data!.empDemo ==
                          null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('No Data Found')));
                      } else {
                        downloadFile(
                            DownloadingController.model.value.data!.empDemo);
                        showToast('Downloading..');
                      }
                    },
                    child: Image.asset(
                      'assets/icons/onboarding.png',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(12.0),
            child: Card(
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text('Rules for Use of Force (RUF)'),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  InkWell(
                    onTap: () {
                      uploadcertificateFunction('rule_force', context);
                    },
                    child: Image.asset(
                      'assets/icons/document.png',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (DownloadingController.model.value.data!.ruleForce ==
                          null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('No Data Found')));
                      } else {
                        downloadFile(
                            DownloadingController.model.value.data!.ruleForce);
                        showToast('Downloading..');
                      }
                    },
                    child: Image.asset(
                      'assets/icons/onboarding.png',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(12.0),
            child: Card(
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text('SABRE22 NDA'),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  InkWell(
                    onTap: () {
                      uploadcertificateFunction('sabree_nda', context);
                    },
                    child: Image.asset(
                      'assets/icons/document.png',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (DownloadingController.model.value.data!.sabreeNda ==
                          null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('No Data Found')));
                      } else {
                        downloadFile(
                            DownloadingController.model.value.data!.sabreeNda);
                        showToast('Downloading..');
                      }
                    },
                    child: Image.asset(
                      'assets/icons/onboarding.png',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      )
          // : Center(
          //    heightFactor: 18.0,
          //    child: CircularProgressIndicator()),
          ),
    );
  }

  ///Download code
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
            //   // for (int i = 0; i <= 100; i++) {
            //   //   await Future<void>.delayed(const Duration(seconds: 1), () async {
            //   final AndroidNotificationDetails androidPlatformChannelSpecifics =
            //   AndroidNotificationDetails('progress channel', 'progress channel',
            //   channelShowBadge: false,
            //   importance: Importance.max,
            //   priority: Priority.high,
            //   onlyAlertOnce: true,
            //   showProgress: true,
            //   maxProgress: int.parse(progress),
            //   progress: 100);
            //   final NotificationDetails platformChannelSpecifics =
            //   NotificationDetails(android: androidPlatformChannelSpecifics);
            //    flutterLocalNotificationsPlugin.show(
            //   0,
            //   'progress notification title',
            //   'progress notification body',
            //   platformChannelSpecifics,
            //   payload: 'item x');
            //   // });
            // // }
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
        progress.value = "Download Completed.";
        path = dirloc + downloadLink.split('/').last;
        _onPressed = () {
          downloadFile(downloadLink);
        };
      });
      print(downloadLink);
      print(path);
      OpenFile.open(path);
    } else {
      setState(() {
        progress.value = "Permission Denied!";
        // _onPressed = () {
        //   downloadFile(downloadLink);
        // };
      });
    }
  }

  PlatformFile? objFile = null;
}
