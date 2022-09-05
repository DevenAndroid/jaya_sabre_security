import 'package:flutter/material.dart';

import '../resources/theme/app_theme.dart';


class BoxTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  bool obSecure;
  final bool readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final bool isMulti;
  final bool autofocus;
  final bool enabled;
  final String? errorText;
  final String? hintText;
  final IconData? suffixIcon;
  final Widget? prefix;

  BoxTextField(
      {
        this.controller,
        this.validator,
        this.keyboardType = TextInputType.text,
        required this.obSecure,
        this.onTap,
        this.isMulti = false,
        this.readOnly = false,
        this.autofocus = false,
        this.errorText,
        @required this.hintText,
        this.suffixIcon,
        this.prefix,
        this.enabled = true,
        this.onEditingCompleted,
        this.onChanged});

  @override
  State<BoxTextField> createState() => _BoxTextFieldState();
}

class _BoxTextFieldState extends State<BoxTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingCompleted,
        // autofocus: autofocus,
        minLines: widget.isMulti ? 4 : 1,
        maxLines: widget.isMulti ? null : 1,
        onTap: widget.onTap,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        obscureText: widget.obSecure,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          errorText: widget.errorText,
          prefixIcon: widget.prefix,
          suffixIcon: InkWell(
              onTap: (){
                setState(() {
                  widget.obSecure = !widget.obSecure;
                  print("ksajdfg"+widget.obSecure.toString());
                });
              },
              child: Icon(widget.suffixIcon)),

          // labelStyle: TextStyle(fontSize: lableFontSize()),
          // labelText: label,
          hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 15),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.primaryColor, width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color:Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          // enabledBorder: textFieldfocused(),
          // border: textFieldfocused(),
          // focusedBorder: textFieldfocused(),
          // errorBorder: errorrTextFieldBorder(),
          // focusedErrorBorder: errorrTextFieldBorder(),
        ),
        validator: widget.validator);
  }
}