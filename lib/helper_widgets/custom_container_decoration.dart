import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../configs/text_style.dart';
import '../configs/ui.dart';

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
      decoration: Ui.getBoxDecoration(borderRadius: 20.0),
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
