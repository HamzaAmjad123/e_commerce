import 'package:e_commerce/configs/color.dart';
import 'package:flutter/material.dart';

class CustomOrderWidget extends StatelessWidget {
  final String orderText;
  final bool color;
  final Function()? onTap;
  CustomOrderWidget({required this.orderText, required this.color, this.onTap,});

  @override
  Widget build(BuildContext context) {
    return      InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Text(
              "${orderText}",
              style: TextStyle(
                  color: color?bgColor:blackColor,
                  fontSize: color ? 14.0 : 12.0,
                  fontWeight:color
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: color?bgColor:null,
        ),
        margin: EdgeInsets.only(top: 10.0),
        height: 2.5,
        width: color?100.0:0.0,

      )
          ],
        ));
  }
}



