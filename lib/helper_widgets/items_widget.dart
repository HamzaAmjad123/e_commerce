import 'package:e_commerce/configs/color.dart';
import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  final String? itemText;
   ItemsWidget({this.itemText=""});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(itemText!,style: TextStyle(color: blackColor,fontSize: 15.0,fontWeight: FontWeight.w500),),
         SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
      ],
    );
  }
}

