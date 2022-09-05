import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:client_information/client_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sabre_security_app/router/my_router/my_router.dart';
import 'package:sabre_security_app/utils/ApiConstant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controllers/profile_controller.dart';
import '../../models/ModelLogIn.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

bool loading = false;

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (pref.getString('user') == null) {
        Get.offAllNamed(MyRouter.boardingprocessScreen);
      } else {
        Get.offAllNamed(MyRouter.bottomNavbarScreen);
      }
    });
    _getClientInformation();
  }

  Future<void> _getClientInformation() async {
    ClientInformation? info;
    try {
      info = await ClientInformation.fetch();
    } on PlatformException {
      log('Failed to get client information');
    }
    print("Decvice Id::::::  ${info!.deviceId}");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('deviceId', info.deviceId.toString());
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: screenSize.width * 45,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/img_splash.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(13),
          child: const Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "© Copyright 2022 - Sabre 22. All Rights Reserved",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
        Positioned(
          top: screenSize.width * 0.75,
          left: screenSize.width * 0.22,
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            height: screenSize.width * 0.40,
            width: screenSize.width * 0.55,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sabrelogo.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
