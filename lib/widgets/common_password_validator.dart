// common text field
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/theme/app_theme.dart';

class CommonPasswordFieldWidget extends StatelessWidget {
  IconData? suffixIcon;
  Widget? suffix;
  Color? bgColor;
  bool? isPassword;
  String? Function(String?)? validator;
  RxBool? isPasswordShow = false.obs;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  String? hint;
  TextEditingController? controller;
  int? value = 0;
  bool? obscureText;

  CommonPasswordFieldWidget({
    Key? key,
    this.suffixIcon,
    this.hint,
    this.isPassword,
    this.keyboardType,
    this.textInputAction,
    this.controller,
    this.bgColor,
    this.validator,
    this.suffix,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller,
                  obscureText: !isPasswordShow!.value,
                  autofillHints: const [AutofillHints.password],
                  validator: validator,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      filled: true,
                      fillColor: Colors.white60,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 18),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0))),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppTheme.primaryColor, width: 3.0),
                          borderRadius: BorderRadius.circular(15.0)),
                      suffixIcon: !isPasswordShow!.value
                          ? GestureDetector(
                              onTap: () {
                                isPasswordShow!.value = !isPasswordShow!.value;
                              },
                              child: Icon(
                                Icons.visibility_off,
                                color: isPasswordShow!.value
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                isPasswordShow!.value = !isPasswordShow!.value;
                              },
                              child: Icon(
                                CupertinoIcons.eye,
                                color: isPasswordShow!.value
                                    ? AppTheme.primaryColor
                                    : Colors.grey,
                              ),
                            )),
                ),
              ),
            ],
          ),
        ));
  }
}
