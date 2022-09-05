import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:sabre_security_app/resources/theme/app_theme.dart';
import 'package:sabre_security_app/router/my_router/my_router.dart';
import 'package:sabre_security_app/utils/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationService.initialize();
  runApp(const MyApp());
}
// Future<void> main() async {
//   //WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp();
//   WidgetsFlutterBinding.ensureInitialized();
//   Firebase.initializeApp(
//       options: const FirebaseOptions(
//     apiKey: "AIzaSyB-VbkD0cvpjVlirzJLVHV_uVImDjtDTjA",
//     appId: "1:954883934113:android:92af4a96fd40c4d473ade0",
//     messagingSenderId: '...',
//     projectId: "sabre-security-a5c89",
//   ));
//
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: GetMaterialApp(
        darkTheme: ThemeData.light(),
        defaultTransition: Transition.rightToLeft,
        debugShowCheckedModeBanner: false,
        initialRoute: "/splash",
        getPages: MyRouter.route,
        builder: EasyLoading.init(),
        // initialBinding: AllBindings(),
        // home: const MyHomePage(),
        theme: ThemeData(
            fontFamily: 'Raleway',
            primaryColor: AppTheme.primaryColor,
            highlightColor: AppTheme.primaryColor,
            scrollbarTheme: ScrollbarThemeData().copyWith(
              thumbColor: MaterialStateProperty.all(AppTheme.primaryColor),
            ),
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: AppTheme.primaryColor)
                .copyWith(secondary: AppTheme.primaryColor)),
      ),
    );
  }
}
