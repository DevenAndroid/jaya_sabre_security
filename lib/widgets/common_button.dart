import 'package:flutter/material.dart';

import '../resources/theme/app_theme.dart';

class CommonButton extends StatelessWidget {
  String buttonText;
  VoidCallback function;
  double buttonWidth;
  CommonButton(this.buttonText, this.function, this.buttonWidth, {Key? key})
      : super(key: key); // change this

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(30),
      color: AppTheme.primaryColor,
      child: MaterialButton(
        minWidth: buttonWidth,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: function, // add this here
        child: Text(buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18)
                .copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
