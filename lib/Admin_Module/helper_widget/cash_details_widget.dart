

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../configs/text_style.dart';
import '../../configs/ui.dart';

class CashDetailsWidget extends StatelessWidget {
  final String totalAmount;
  final String totalPaid;
  final String totalReam;

   CashDetailsWidget({required this.totalAmount, required this.totalPaid, required this.totalReam});

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 10, bottom: 5),
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        decoration: Ui.getBoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Total Amount", style: titleStyle),
                  Text("Pkr ${totalAmount}", style: rsStyle),
                ],
              ),
            ),
            Container(
              color: Colors.black38,
              width: 2,
              height: 50,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Total Paid", style: titleStyle),
                  Text("Pkr ${totalPaid}", style: rsStyle),
                ],
              ),
            ),
            Container(
              color: Colors.black38,
              width: 2,
              height: 50,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Remaining", style: titleStyle),
                  Text("Pkr ${totalReam}", style: rsStyle),
                ],
              ),
            ),
          ],
        ));
  }
}
