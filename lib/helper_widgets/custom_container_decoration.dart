

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../configs/color.dart';
import '../configs/text_style.dart';

class CustomContainerDecoration extends StatelessWidget {
  final String amountText;
  final Widget? widget;
  final String? imgUrl;
  bool helper;

  CustomContainerDecoration({ required this.amountText, this.widget,this.helper=false, this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
      padding: EdgeInsets.only(right:helper?0.0: 10.0,left: 10.0, top: 12.0,bottom: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        // border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(
              5.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: 45,
            child: Image.asset(imgUrl!),
          ),
          SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text(titleText, style: subtitleStyle),
              widget!,
              Text(amountText, style: rsStyle),
            ],
          ),
        ],
      ),
    );
  }
}
