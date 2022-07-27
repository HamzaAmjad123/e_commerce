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
  final Function()? onTap;

  const DrawerLinkWidget({
    this.icon,
    this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          children: [
            Icon(
              icon,
              color: bgColor,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              width: 1,
              height: 24,
              color: Get.theme.focusColor.withOpacity(0.2),
            ),
            Expanded(
              child: Text(text!, style: Get.textTheme.bodyText2!.merge(TextStyle(fontSize: 14))),
            ),
          ],
        ),
      ),
    );
  }
}
