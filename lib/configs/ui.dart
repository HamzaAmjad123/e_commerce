import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ui {
  static BoxDecoration getBoxDecoration({double? borderRadius}) {
    return BoxDecoration(
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
      ],
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
    );
  }
}
