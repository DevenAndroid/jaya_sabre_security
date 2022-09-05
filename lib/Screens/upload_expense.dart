import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_utils/file_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sabre_security_app/models/ModelUserExpenses.dart';
import 'package:sabre_security_app/resources/theme/app_theme.dart';
import 'package:sabre_security_app/utils/ApiConstant.dart';

import '../controllers/assignment_controller.dart';
import '../controllers/getHomeController.dart';
import '../controllers/getUserExpensesController.dart';
import '../helper.dart';
import '../models/ModelHomeData.dart';
import '../models/model_assignment.dart';
import '../repository/get_onboardingUpload_repository.dart';
import '../widgets/common_button.dart';
import '../widgets/common_formfields.dart';

class UploadExpenses extends StatefulWidget {
  @override
  State<UploadExpenses> createState() => _UploadExpensesState();
}

class _UploadExpensesState extends State<UploadExpenses>
    with SingleTickerProviderStateMixin {
  late final pdfUrl;

  bool downloading = false;
  RxString progress = "0".obs;
  RxString progress1 = "".obs;
  var path = "No Data";

  // var platformVersion = "Unknown";
  var _onPressed;

  //late Directory externalDir;

  late TabController _tabController;
  TextEditingController filtter = TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String dropdownvalue = '';
  var job_id;

  FilePickerResult? uploadcertificate;
  String? uploadcertificateFileName;
  PlatformFile? uploadcertificatePickedFile;
  bool uploadcertificateLoading = false;
  File? uploadcertificateDisplay;
  String? uploadcertificate1;

  void uploadcertificateFunction() async {
    try {
      setState(() {
        uploadcertificateLoading = true;
      });
      uploadcertificate = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowMultiple: false,
          allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'docx', 'doc']);
      if (uploadcertificate != null) {
        uploadcertificateFileName = uploadcertificate!.files.first.name;
        uploadcertificatePickedFile = uploadcertificate!.files.first;
        uploadcertificateDisplay =
            File(uploadcertificatePickedFile!.path.toString());
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

  final _tabs = [
    const Tab(text: 'Upload'),
    const Tab(text: 'Expenses'),
  ];

  final controller = Get.put(GetUserExpenses());

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    controller.getData();
    // downloadFile(downloadLink);
  }

  PlatformFile? objFile;

  void chooseFileUsingFilePicker() async {
    //-----pick file by file picker,

    var result = await FilePicker.platform.pickFiles(
      withReadStream:
          true, // this will return PlatformFile object with read stream
    );
    if (result != null) {
      setState(() {
        objFile = result.files.single;
      });
    }
  }

  // void uploadSelectedFile() async {
  //   //---Create http package multipart request object
  //   final request = http.MultipartRequest(
  //     "POST",
  //     Uri.parse("Your API URL"),
  //   );
  //   //-----add other fields if needed
  //   request.fields["id"] = "abc";
  //
  //   //-----add selected file with request
  //   request.files.add(http.MultipartFile(
  //       "Your parameter name on server side", objFile.readStream, objFile!.size,
  //       filename: objFile!.name));
  //
  //   //-------Send request
  //   var resp = await request.send();
  //
  //   //------Read response
  //   String result = await resp.stream.bytesToString();
  //
  //   //-------Your response
  //   print(result);
  // }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    Controller.getData();
  }

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  String convertCurrentDateTimeToString() {
    String formattedDateTime =
        DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
    return formattedDateTime;
  }

  AssignmentController Controller = Get.put(AssignmentController());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var deviceWidth = MediaQuery.of(context).size.width * 0.60;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: AppTheme.bodybackground,
              appBar: PreferredSize(
                preferredSize: Size(screenSize.width, 110),
                child: AppBar(
                    systemOverlayStyle: const SystemUiOverlayStyle(
                        statusBarColor: AppTheme.primaryColor),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    )),
                    backgroundColor: AppTheme.primaryColor,
                    leading: Container(
                        padding: EdgeInsets.only(bottom: 5),
                        margin: EdgeInsets.only(left: 10),
                        width: 40,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () => Get.back())),
                    title: const Text("Upload Expense"),
                    centerTitle: true,
                    bottom: TabBar(
                      padding: const EdgeInsets.all(8),
                      controller: _tabController,
                      labelColor: Colors.blue,
                      unselectedLabelColor: Colors.white,
                      tabs: _tabs,
                      indicator: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        color: Colors.white,
                      ),
                    )),
              ),
              body: Container(
                height: MediaQuery.of(context).size.height - 120,
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                child: Form(
                  key: _formKey,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Obx(() {
                        return controller.isDataLoading.value == true
                            ? Container(
                                height:
                                    MediaQuery.of(context).size.height - 120,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      DropdownButtonFormField<UserAssignment>(
                                        isExpanded: true,
                                        // Initial Value
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please select Job type';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: "All",
                                          counterText: "",
                                          filled: true,
                                          focusColor: AppTheme.bodycardColor,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 8, vertical: 16),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide:
                                                      BorderSide(
                                                          color: Colors.grey),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(
                                                              10.0))),
                                          border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: AppTheme.primaryColor,
                                                  width: 2.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                        ),
                                        // Down Arrow Icon
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        // Array list of items
                                        items: List.generate(
                                            Controller.model.value.data!.length,
                                            (index) => DropdownMenuItem(
                                                value: Controller
                                                    .model.value.data![index],
                                                child: Text(Controller
                                                    .model
                                                    .value
                                                    .data![index]
                                                    .title!))),
                                        // After selecting the desired option,it will
                                        // change button value to selected value
                                        onChanged: (newValue) {
                                          setState(() {
                                            job_id = newValue!.id.toString();
                                            dropdownvalue =
                                                newValue!.title.toString();
                                            print(dropdownvalue);
                                          });
                                        },
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      CommonTextFieldWidget(
                                        hint: 'Enter Expenses Name',
                                        controller: filtter,
                                        textInputAction: TextInputAction.done,
                                        bgColor: AppTheme.primaryColor,
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: 'name is required'),
                                        ]),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      DottedBorder(
                                        borderType: BorderType.RRect,
                                        radius: const Radius.circular(20),
                                        padding: const EdgeInsets.only(
                                            left: 40, right: 40, bottom: 10),
                                        color: AppTheme.primaryColor,
                                        dashPattern: const [6],
                                        strokeWidth: 1,
                                        child: uploadcertificateLoading
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : InkWell(
                                                onTap: () {
                                                  uploadcertificateFunction();
                                                },
                                                child:
                                                    uploadcertificatePickedFile !=
                                                            null
                                                        ? Stack(
                                                            children: [
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: const Color(
                                                                        0xfff4f4f4),
                                                                    image: DecorationImage(
                                                                        image: FileImage(
                                                                            uploadcertificateDisplay!),
                                                                        fit: BoxFit
                                                                            .contain),
                                                                    border: Border.all(
                                                                        width:
                                                                            2,
                                                                        color: Colors
                                                                            .black)),
                                                                margin: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        15,
                                                                    horizontal:
                                                                        15),
                                                                width: double
                                                                    .maxFinite,
                                                                height: 180,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                // child: Text(fileName.toString()),
                                                              ),
                                                              Positioned(
                                                                  top: 0,
                                                                  left: 0,
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        uploadcertificatePickedFile =
                                                                            null;
                                                                        uploadcertificateDisplay =
                                                                            null;
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(.6),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8),
                                                                      child:
                                                                          const Icon(
                                                                        Icons
                                                                            .clear,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  )),
                                                            ],
                                                          )
                                                        : Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 10),
                                                            margin:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        10,
                                                                    horizontal:
                                                                        10),
                                                            width: double
                                                                .maxFinite,
                                                            height: 150,
                                                            alignment: Alignment
                                                                .center,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Image.asset(
                                                                  'assets/icons/upload_grey.png',
                                                                  color: Colors
                                                                      .grey,
                                                                  height: 30,
                                                                ),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                const Text(
                                                                  'Upload your certificate here',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                const SizedBox(
                                                                  height: 15,
                                                                ),
                                                                const Text(
                                                                  'Browse',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      color: AppTheme
                                                                          .primaryColor,
                                                                      decorationStyle:
                                                                          TextDecorationStyle
                                                                              .solid,
                                                                      decorationThickness:
                                                                          2,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .underline),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                              ),
                                      ),
                                      const SizedBox(
                                        height: 80,
                                      ),
                                      CommonButton('Submit', () async {
                                        if (_formKey.currentState!.validate()) {
                                          Map<String, String> param = {
                                            "job_id": job_id,
                                            "title": filtter.text,
                                          };
                                          OverlayEntry loader =
                                              Helpers.overlayLoader(context);
                                          Overlay.of(context)!.insert(loader);
                                          await postApiCallMultipart(
                                            param,
                                            'image',
                                            File(uploadcertificateDisplay
                                                    ?.path ??
                                                ""),
                                          ).then((value) {
                                            Helpers.hideLoader(loader);
                                            showToast(value.message);
                                            if (value.status == true) {
                                              param.clear();
                                              controller.getData();
                                              _tabController.animateTo(
                                                  _tabController.index + 1);
                                              setState(() {
                                                filtter.text = "";
                                                uploadcertificatePickedFile =
                                                    null;
                                                uploadcertificateDisplay = null;
                                              });
                                            }
                                          });
                                        }
                                        // showDialog(
                                        //   context: context,
                                        //   builder: (BuildContext context) {
                                        //     return AlertDialog(
                                        //       content: Text("Data Uploading.."),
                                        //       actions: [
                                        //         Obx(() {
                                        //           return Text(progress.value.toString());
                                        //         }),
                                        //         Obx(() {
                                        //           return Container(
                                        //             height: 10,
                                        //             width: double.maxFinite,
                                        //             color: Colors.red,
                                        //             padding: EdgeInsets.only(
                                        //                 left: double.parse(progress.value)),
                                        //             child: Container(
                                        //               color: Colors.green,
                                        //             ),
                                        //           );
                                        //         })
                                        //       ],
                                        //     );
                                        //   },
                                        // );
                                      }, deviceWidth),
                                    ],
                                  ),
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      }),

                      ///Download file
                      Obx(() {
                        return controller.isDataLoading.value == true
                            ? Container(
                                height:
                                    MediaQuery.of(context).size.height - 100,
                                width: MediaQuery.of(context).size.width,
                                child: Obx(() {
                                  return controller.model.value.data!.isEmpty
                                      ? Center(child: Text('No Data found'))
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              AlwaysScrollableScrollPhysics(),
                                          padding: EdgeInsets.only(bottom: 20),
                                          itemCount: controller
                                              .model.value.data!.length,
                                          itemBuilder: (context, index) {
                                            return item(controller
                                                .model.value.data![index]);
                                          });
                                }),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      })
                    ],
                  ),
                ),
              ),
            )));
  }

  Widget item(Data data) {
    var screenSize = MediaQuery.of(context).size;
    return InkWell(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(
                      top: 20, left: 10, right: 10, bottom: 20),
                  margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Expanded(
                    child: Image.asset(
                      'assets/images/pdf.png',
                      height: 50,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.jobTitle.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(data.expenseTitle.toString()),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(data.createdDate.toString())
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () async {
                        downloadFile(data.downloadLink);
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
                                        left:
                                            MediaQuery.of(context).size.width /
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
                      },
                      child: Image.asset(
                        'assets/icons/downloadingicon.png',
                        height: 40,
                        width: 50,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
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
}
