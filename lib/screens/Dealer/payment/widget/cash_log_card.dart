
import 'package:flutter/material.dart';

class CashLogCard extends StatelessWidget {
  final String ? date;
  final String? amount;
  final String? Reciver;
  final String? amountType;
  final String? status;


  CashLogCard({this.date, this.amount, this.Reciver, this.amountType, this.status}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
     margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white70,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Need To implmenet")
        ],
      ),
    );
  }
}
