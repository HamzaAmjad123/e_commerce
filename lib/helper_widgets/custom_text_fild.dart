import 'package:e_commerce/configs/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../configs/text_style.dart';

class CustomTextField extends StatelessWidget {
  final String? headerText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final bool obScureText;
  final bool shape;
  final double? height;
  final String? hintText;
  final String? labelText;
  final IconData? suffixIcon;
  final Function()? sufixOnTap;
  final IconData? prefixIcon;
  final Color suffixIconColor;

  CustomTextField(
      {this.headerText,
        this.height=45,
      this.controller,
      this.focusNode,
      this.inputType,
      this.inputAction,
      this.onChange,
      this.onSubmit,
      this.obScureText = false,
      this.shape = false,
      this.hintText,
      this.labelText,
      this.suffixIcon,
      this.prefixIcon, this.sufixOnTap,  this.suffixIconColor=bgColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerText == null ? SizedBox() : Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: headerText==null?0.0:8.0,
            vertical: headerText==null?0.0:0.0,
          ),
          child: Text(headerText!,style: subtitleStyle,),
        ),
        Container(
          height: 45.0,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            style: TextStyle(color: shape?Colors.black:null),
            controller: controller,
            focusNode: focusNode,
            textInputAction: inputAction,
            keyboardType: inputType,
            onChanged: onChange,
            onSubmitted: onSubmit,
            obscureText: obScureText,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(8.0),
              hintText: hintText,
              labelText: labelText,
              hintStyle: TextStyle(color: shape?Colors.grey:null),
              labelStyle: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w400),
              enabledBorder: shape
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(color: Colors.grey,width: 1.2),
                    )
                  : UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: bgColor, width: 3.0)),
              focusedBorder: shape
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color:  Colors.grey, width: 1.8))
                  : UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: bgColor, width: 3.0)),
              prefixIcon: prefixIcon == null
                  ? null
                  : Icon(
                      prefixIcon,
                      color: shape? Colors.grey:bgColor,
                    ),
              suffixIcon: suffixIcon == null
                  ? null
                  : IconButton(
                    icon: Icon(  suffixIcon),
                      onPressed: sufixOnTap,
                      color: suffixIconColor,
                    ),
            ),
          ),
        ),
        shape?SizedBox()
        :SizedBox(
          height: 5.0,
        )
      ],
    );
  }
}
