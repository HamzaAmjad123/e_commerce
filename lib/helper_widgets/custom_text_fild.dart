import 'package:e_commerce/configs/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? headerText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final bool obScureText;
  final String? hintText;
  final String? labelText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;

  CustomTextField(
      {this.headerText,
      this.controller,
      this.focusNode,
      this.inputType,
      this.inputAction,
      this.onChange,
      this.onSubmit,
      this.obScureText = false,
      this.hintText,
      this.labelText,
      this.suffixIcon,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerText == null ? SizedBox() : Text(headerText!),
        Container(
          height: 45.0,
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            textInputAction: inputAction,
            keyboardType: inputType,
            onChanged: onChange,
            onSubmitted: onSubmit,
            obscureText: obScureText,
            decoration: InputDecoration(
              hintText: hintText,
              labelText: labelText,
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: bgColor,width:3.0)),
              focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: bgColor,width: 3.0)),
              prefixIcon: prefixIcon==null? null:Icon(prefixIcon,color: bgColor,),
              suffixIcon: suffixIcon==null? null:Icon(suffixIcon,color: bgColor,),

            ),

          ),
        ),
        SizedBox(height: 5.0,)
      ],
    );
  }
}
