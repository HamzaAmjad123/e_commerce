

import 'package:flutter/cupertino.dart';

import '../../configs/text_style.dart';

class CustomDDText extends StatelessWidget {
  final String ddText;
   CustomDDText({ required this.ddText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 4.0),
      child: Text("${ddText}",style: subtitleStyle,),
    );
  }
}
class CustomDDRow extends StatelessWidget {
  final String title1;
  final String title2;

   CustomDDRow({ required this.title1, required this.title2});

  @override
  Widget build(BuildContext context) {
    return Row(
    children:[
      Expanded(child: CustomDDText(ddText:title1 ,)),
      Expanded(child: CustomDDText(ddText:title2 ,)),
    ],
    );
  }
}

