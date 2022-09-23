
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../configs/color.dart';
import '../../../../configs/text_style.dart';

class CashLogCard extends StatelessWidget {
  String? month;
  var day;
  var year;
  String?time;
  final String? date;
  final String? amount;
  final  String? name;
  final int? transactionType;
  final int? status;
  CashLogCard({this.amount, this.transactionType, this.status, this.name,this.date}) ;
  @override
  Widget build(BuildContext context) {
    getFormatedDate(date);
    return  Card(
      color: Colors.grey[200],
      margin: EdgeInsets.symmetric(vertical: 12.0,horizontal: 5.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 12.0),
            leading: Container(
              width: 50.0,
              decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("$day"),
                  Text("$month"),
                  Text("$year")
                ],
              ),
            ),
            title: Text("Reciver Name:\n"+name!,style: TextStyle(fontSize: 14),),
            subtitle: Text("Paid Amount:"+amount!,style: TextStyle(height: 1,color: bgColor)),
            trailing:  Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(color: status==0?Colors.blue:status==1?bgColor:status==2?Colors.green:Colors.red),
                    borderRadius: BorderRadius.circular(5.0)
                ),
                child: Text(status==0?"unknown":status==1?"pending":status==2?"approved":"cancelled")),
          ),
          Container(
            height: 1.5,
            width: double.infinity,
            color: lightBlackColor,
          ),
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
              decoration: BoxDecoration(
                // border: Border.all(color: bgColor),
                  borderRadius: BorderRadius.circular(5.0)
              ),
              child: Text("Transaction Type:"+"  "+getType(transactionType!),style: titleStyle,))
        ],
      ),
    );
  }
  getType(int x){
    return x==1?"cash":"others";
  }
  getFormatedDate(_date) {
    DateTime dates = DateTime.parse(_date);
    month = DateFormat('MMMM').format(dates).substring(0, 3);
    day = dates.day;
    year=dates.year;
    time = DateFormat('hh:mm a').format(dates);
  }
}
