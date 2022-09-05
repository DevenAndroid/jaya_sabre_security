import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sabre_security_app/Screens/checklist_screen.dart';
import 'package:sabre_security_app/Screens/userFlow/onboarding_process.dart';

import '../../Screens/Details_Screen.dart';
import '../../Screens/assignment_screen.dart';
import '../../Screens/availability_screen.dart';
import '../../Screens/bottom_navBar.dart';
import '../../Screens/certificate_notifications.dart';
import '../../Screens/edit_profile_screen.dart';
import '../../Screens/faq_screen.dart';
import '../../Screens/homescreen.dart';
import '../../Screens/job_details_page_screen.dart';
import '../../Screens/notifications_Screen.dart';
import '../../Screens/onboarding.dart';
import '../../Screens/privacy_policy_screen.dart';
import '../../Screens/profile_screen.dart';
import '../../Screens/terms_and_conditions.dart';
import '../../Screens/upload_certificate.dart';
import '../../Screens/upload_expense.dart';
import '../../Screens/userFlow/Bio_page.dart';
import '../../Screens/userFlow/change_password_screen.dart';
import '../../Screens/userFlow/forgot_new_password.dart';
import '../../Screens/userFlow/forgot_password_screen.dart';
import '../../Screens/userFlow/licenses_Screen.dart';
import '../../Screens/userFlow/login.dart';
import '../../Screens/userFlow/personal_page_screen.dart';
import '../../Screens/userFlow/registerScreen.dart';
import '../../Screens/userFlow/splash_screen.dart';
import '../../Screens/userFlow/verify_email_screen.dart';
import '../../Screens/userFlow/verify_forgot_password.dart';

class MyRouter {
  static var loginScreen = "/loginScreen";
  static var splashScreen = "/splashScreen";
  static var onBoarding = "/onBoarding";
  static var registerScreen = "/registerScreen";
  static var personalScreen = "/personalScreen";
  static var bioAboutScreen = "/bioAboutScreen";
  static var licensesScreen = "/LicensesScreen";
  static var verifyEmailScreen = "/verifyEmailScreen";
  static var verifyForgotPassword = "/verifyForgotPassword";
  static var assignmentScreen = "/assignmentScreen";
  static var availabilityScreen = "/availabilityScreen";
  static var bottomNavbarScreen = "/bottomNavbarScreen";
  static var editProfileScreen = "/editProfileScreen";
  static var homeScreen = "/homeScreen";
  static var profileScreen = "/profileScreen";
  static var privacyPolicyScreen = "/privacyPolicyScreen";
  static var termsScreen = "/termsScreen";
  static var uploadExpenses = "/uploadExpenses";
  static var faqScreen = "/faqScreen";
  static var detailsScreen = "/detailsScreen";
  static var checklistScreen = "/checklistScreen";
  static var boardingprocessScreen = "/boardingprocessScreen";
  static var uploadCertificate = "/uploadCertificate";
  static var onBoardingScreen = "/onBoardingScreen";
  static var subscriptionScreen = "/subscriptionScreen";
  static var jobDetailsPage = "/jobDetailsPage";
  static var forgotPasswordScreen = "/forgotPasswordScreen";
  static var forgotNewPassword = "/forgotNewPassword";
  static var changePasswordScreen = "/changePasswordScreen";
  static var notificationsScreen = "/notificationsScreen";

  static var route = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: MyRouter.splashScreen, page: () => const SplashScreen()),
    GetPage(name: MyRouter.loginScreen, page: () => const LoginScreen()),
    // GetPage(name: MyRouter.onBoarding, page: () => Onbording()),
    GetPage(name: MyRouter.registerScreen, page: () => const RegisterScreen()),
    GetPage(name: MyRouter.personalScreen, page: () => const PersonalScreen()),
    GetPage(name: MyRouter.bioAboutScreen, page: () => const BioAboutScreen()),
    GetPage(name: MyRouter.licensesScreen, page: () => const LicensesScreen()),
    GetPage(
        name: MyRouter.assignmentScreen,
        page: () => const AssignmentScreen(
              showOwnAppBar: true,
            )),
    GetPage(
        name: MyRouter.availabilityScreen,
        page: () => AvailabilityScreen(
              showOwnAppBar: true,
            )),
    GetPage(name: MyRouter.bottomNavbarScreen, page: () => BottomNavigation()),
    GetPage(
        name: MyRouter.editProfileScreen,
        page: () => const EditProfileScreen(
              showOwnAppBar: true,
            )),
    GetPage(name: MyRouter.homeScreen, page: () => const HomeScreen()),
    GetPage(
        name: MyRouter.profileScreen,
        page: () => const ProfileScreen(
              showOwnAppBar: true,
            )),
    GetPage(
        name: MyRouter.verifyEmailScreen,
        page: () => const VerifyEmailScreen(
              title: '',
            )),
    GetPage(
        name: MyRouter.verifyForgotPassword,
        page: () => const VerifyForgotPasswordScreen(
              title: '',
            )),
    GetPage(
        name: MyRouter.privacyPolicyScreen,
        page: () => PrivacyPolicyScreen(
              slug: '',
            )),
    GetPage(
        name: MyRouter.termsScreen,
        page: () => TermsAndConditionScreen(
              slug: '',
            )),
    GetPage(name: MyRouter.uploadExpenses, page: () => UploadExpenses()),
    GetPage(
        name: MyRouter.notificationsScreen, page: () => NotificationScreen()),
    GetPage(name: MyRouter.faqScreen, page: () => FaqScreen()),
    GetPage(name: MyRouter.detailsScreen, page: () => const DetailScreen()),
    GetPage(
        name: MyRouter.onBoardingScreen, page: () => const OnBoardingScreen()),
    GetPage(
        name: MyRouter.checklistScreen, page: () => const CheckListScreen()),
    GetPage(
        name: MyRouter.boardingprocessScreen,
        page: () => const OnBoardingProcess()),
    GetPage(
        name: MyRouter.uploadCertificate,
        page: () => UploadCertificateScreen()),
    GetPage(
        name: MyRouter.subscriptionScreen,
        page: () => const SubscriptionScreen()),
    GetPage(
        name: MyRouter.jobDetailsPage,
        page: () => const JobDetailsPageScreen()),
    GetPage(
        name: MyRouter.forgotPasswordScreen,
        page: () => ForgotPasswordScreen(
              title: '',
            )),
    GetPage(
        name: MyRouter.forgotNewPassword,
        page: () => ForgotNewPassword(
              title: '',
            )),
    GetPage(
        name: MyRouter.changePasswordScreen,
        page: () => const ChangePasswordScreen(
              title: '',
            )),
  ];
}
