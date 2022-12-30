import 'package:flutter/material.dart';

import '../configs/color.dart';

class CustomButton extends StatefulWidget {
  final double? height;
  final double? width;
  final String? text;
  final Color? textColor;
  final Color? buttonColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double horizontalMargin;
  final double verticalMargin;
  final Function()? onTap;
  final Color borderColor;

  CustomButton(
      {this.height = 45.0,
      this.width=110.0,
      this.text='',
      this.textColor=whiteColor,
      this.buttonColor=bgColor,
      this.fontSize=14.0,
      this.fontWeight=FontWeight.normal,
      this.horizontalMargin=0.0,
      this.verticalMargin=0.0, this.onTap,this.borderColor=Colors.transparent});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      margin: EdgeInsets.symmetric(horizontal: widget.horizontalMargin,vertical: widget.verticalMargin),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(

              padding: EdgeInsets.symmetric(
                vertical: widget.verticalMargin,
                horizontal: widget.horizontalMargin
              ),
              primary: widget.buttonColor,
              shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(12.0)),

            side: BorderSide(color: widget.borderColor)
          ),
          onPressed: widget.onTap,
          child: Text(
            widget.text!,
            style: TextStyle(
                color: widget.textColor, fontSize: 14.0, fontWeight: FontWeight.w600),
          )),
    );
  }
}
class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;
  final String text;
  final double width;
  final Color iconColor;
  final Color buttonColor;
  final double height;
  final Color textColor;
   CustomIconButton({required this.icon, this.onTap, required this.text, this.width=100.0,  this.height=45.0,  this.iconColor=bgColor,  this.buttonColor=whiteColor,  this.textColor=bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: redColor,
      margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
      height:  height,
      width: width,
      child: TextButton.icon(
        style: TextButton.styleFrom(
          side: BorderSide(color: bgColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)
          ),
          alignment: Alignment.center,
         backgroundColor: buttonColor,
          elevation: 10.0
        ),
          onPressed: onTap,
          icon: Icon(icon,color:iconColor ,),
          label: Text("$text",style: TextStyle(color: textColor,fontSize: 15.0,fontWeight: FontWeight.w500),)),
    );
  }
}
