import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../resources/theme/app_theme.dart';

class ApiUrls {
  static const String apiBaseUrl = 'http://sabre.eoxyslive.com/api/';
  static const String loginUrl = "${apiBaseUrl}login";
  static const String personalInfoUrl = "${apiBaseUrl}register";
  static const String homeUrl = "${apiBaseUrl}home";
  static const String sendAssignment = "${apiBaseUrl}single-assignment";
  static const String changePassword = "${apiBaseUrl}change-password";
  static const String applyJob = "${apiBaseUrl}apply-job";
  static const String userExpenses = "${apiBaseUrl}user-Expense";
  static const String addExpenses = "${apiBaseUrl}add-user-Expense";
  static const String updateCheckList = "${apiBaseUrl}update-check-list";
  static const String assignmentUrl = "${apiBaseUrl}user-assignment";
  static const String verifyOTPUrl =
      "${apiBaseUrl}registration-otp-verification";

  static const String onboardingDownloadingUrl =
      "${apiBaseUrl}onboarding-download-document";
  static const String onboardingUploadUrl =
      "${apiBaseUrl}onboarding-upload-document";
  static const String userAssignmentUrl = "${apiBaseUrl}user-assignment";
  // static const String apiBaseUrl = 'http://sabre.eoxyslive.com/api/';
  // static const String loginUrl = "${apiBaseUrl}login";
  static const String registerStepOne = "${apiBaseUrl}register";
  static const String registerStepTwo = "${apiBaseUrl}register-step-two";
  static const String registerStepThree = "${apiBaseUrl}register-step-three";
  static const String stateListUrl = "${apiBaseUrl}states";

  // static const String personalInfoUrl = "${apiBaseUrl}register";
  // static const String licensesDataUrl = "${apiBaseUrl}register-step-two";
  // static const String homeUrl = "${apiBaseUrl}home";
  // static const String applyJob = "${apiBaseUrl}apply-job";

  static const String contactInfo = "${apiBaseUrl}contact-info";
  static const String pages = "${apiBaseUrl}page";
  static const String notification = "${apiBaseUrl}notification-list";
  static const String notificationStatus = "${apiBaseUrl}notification-status";
  static const String certificateNotification = "${apiBaseUrl}job-category";
  static const String saveCertificateNotification =
      "${apiBaseUrl}save-certificate-subscription";
  static const String sop = "${apiBaseUrl}sop-list";
  static const String checkList = "${apiBaseUrl}check-list";
  static const String uploadCertificateUrl = "${apiBaseUrl}upload-certificate";
  static const String showUploadCertificateUrl =
      "${apiBaseUrl}show-upload-certificate";
  static const String forgotPassOtpUrl = "${apiBaseUrl}forgot-otp";
  static const String resendOtpUrl = "${apiBaseUrl}resend-otp";
  static const String deleteuploadfile =
      "${apiBaseUrl}delete-upload-certificate";
  static const String createNewPassword = "${apiBaseUrl}create-new-password";
  // static const String changePassword = "${apiBaseUrl}change-password";
  static const String updateUserProfile = "${apiBaseUrl}update-profile";
  static const String getUserProfile = "${apiBaseUrl}get-user-profile";
  static const String userAvailabilityUpdate =
      "${apiBaseUrl}update-user-availability";
  static const String isAvailableUser = "${apiBaseUrl}is-available";
  static const String userAvailability = "${apiBaseUrl}user-availability";
}

showToast(message) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppTheme.primaryColor,
      textColor: Colors.white,
      fontSize: 16.0);
}

showToast1(message) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: AppTheme.primaryColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
