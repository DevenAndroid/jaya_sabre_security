import 'package:shared_preferences/shared_preferences.dart';

class ApiUrls1 {
  static const String apiBaseUrl = 'http://sabre.eoxyslive.com/api/';

  static const String forgotPassOtpUrl = "${apiBaseUrl}forgot-otp";
   static const String createNewPassword = "${apiBaseUrl}create-new-password";
  static const String changePassword = "${apiBaseUrl}change-password";
  static const String updateUserProfile = "${apiBaseUrl}update-profile";
  static const String getUserProfile = "${apiBaseUrl}get-user-profile";
  static const String userAvailabilityUpdate = "${apiBaseUrl}update-user-availability";
  static const String isAvailableUser = "${apiBaseUrl}is-available";
  static const String userAvailability = "${apiBaseUrl}user-availability";
}

Future<bool> isLogIn() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('user') == null ? false : true;
}
