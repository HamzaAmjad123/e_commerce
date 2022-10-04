/*
 * File name: drawer_item_card.dart
 * Last modified: 2022.02.10 at 14:56:16
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2022
 */

import 'package:e_commerce/configs/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerLinkWidget extends StatelessWidget {
  final IconData? icon;
  final String? text;
  bool isLogout;
  final Function()? onTap;

   DrawerLinkWidget({
    this.icon,
    this.isLogout=false,
    this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: isLogout?Colors.red:bgColor,
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Text(text!, style: isLogout?TextStyle(color: Colors.red) :Get.textTheme.bodyText2!.merge(TextStyle(fontSize: 14))),
                  ),
                ],
              ),
            ),
            Container(
              width: 30,

              child: isLogout?SizedBox():IconButton(
                onPressed: onTap,
                icon:Icon( Icons.arrow_forward_ios_outlined,color: Colors.grey,size: 14,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
