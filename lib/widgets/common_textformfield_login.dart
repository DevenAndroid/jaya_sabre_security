import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get.dart';

import '../resources/theme/app_theme.dart';

class CommonTextFieldWidget extends StatelessWidget {
  IconData icon;
  Widget? suffix;
  String type;
  String hint;
  bool isPassword;
  RxBool isPasswordShow = false.obs;
  TextEditingController controller;

  CommonTextFieldWidget({required this.hint,
    required this.icon,
    this.suffix,
    required this.type,
    required this.isPassword,
    required this.controller, required obscureText});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                obscureText: isPasswordShow.value,
                validator: (value) {
                  if (isPassword!) {
                    if (value!
                        .trim()
                        .isEmpty) {
                      return 'Please enter password';
                    } else if (value.length <
                        4) {
                      return 'Password must be greater then 6';
                    }

                  } else {
                    if (value!
                        .trim()
                        .isEmpty) {
                      return 'Please enter username or email';
                    } else if (value.length <
                        4) {
                      return 'Please enter valid username or email';
                    }
                  }
                  return null;
                },
                keyboardType: type == '2' ? TextInputType.number : TextInputType
                    .text,
                // maxLength: isPassword ? 16 : 10,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    hintText: hint,
                    counterText: "",
                    filled: true,
                    errorMaxLines: 2,
                    fillColor: AppTheme.colorEditFieldBg,
                    focusColor: AppTheme.colorEditFieldBg,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                    // focusedBorder: InputBorder.none,
                    // enabledBorder: InputBorder.none,
                    // errorBorder: InputBorder.none,
                    // disabledBorder: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: AppTheme.primaryColor),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: AppTheme.primaryColor),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppTheme.primaryColor, width: 2.0),
                        borderRadius: BorderRadius.circular(5.0)),
                    prefixIcon: Icon(icon, color: Colors.grey,
                    ),
                    suffixIcon: isPassword
                        ? GestureDetector(
                      onTap: () {
                        isPasswordShow.value = !isPasswordShow.value;
                      },
                      child: Icon(
                        CupertinoIcons.eye,
                        color: isPasswordShow.value
                            ? Colors.red
                            : Colors.grey,
                      ),
                    )
                        : SizedBox.shrink()),
              ),
            ),
          ],
        ),
      );
    });
  }
}
