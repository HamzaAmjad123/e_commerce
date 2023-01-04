import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../configs/color.dart';

class CustomBarWidget extends StatelessWidget {
 final TextEditingController? controller;
 final Function(String)? onSubmit;
 final IconData? icon;
 final Function()? iconOnTap;

   CustomBarWidget({this.controller, this.onSubmit, this.icon, this.iconOnTap});

  @override
  Widget build(BuildContext context) {
    return   Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height*0.13,
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              )
          ),),
        Container(
          height: MediaQuery.of(context).size.height*0.10,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          // decoration: BoxDecoration(
          //   color: Colors.white,
          // ),
          child: TextField(
            controller: controller,
            onSubmitted:onSubmit,
            decoration: InputDecoration(

                fillColor: whiteColor,
                filled: true,
                hintText: "Search",
                contentPadding:
                EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: bgColor, width: 1.3)),
                suffixIcon: InkWell(
                  onTap: iconOnTap,
                  child: Icon(
                    icon,
                    color: bgColor,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
