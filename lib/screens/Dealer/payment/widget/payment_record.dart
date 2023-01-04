import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../model/cash_book_model.dart';
import '../../../../utils/functions.dart';

class PaymentRecordWidget extends StatelessWidget {
  LedgerDetails ledgerDetails;
  int? index;

  PaymentRecordWidget({required this.ledgerDetails,this.index});

  @override
  Widget build(BuildContext context) {
    String date = ledgerDetails.date!;
    String  debitText=ledgerDetails.debit.toString();
    String creditText=ledgerDetails.credit.toString();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          width: MediaQuery.of(context).size.width/2.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${index}",
                style: TextStyle(height: 1.4,color: Colors.black),),
              Text("${Methods().getFormatedDate(date)}",
                style: TextStyle(height: 1.4,color: Colors.black),),

            ],
          ),
        ),
      Container(
        width: MediaQuery.of(context).size.width/2.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(" ${creditText.length>5?creditText.substring(0,4)+"..":creditText}",
              style: TextStyle(height: 1.8,color: Colors.green),maxLines: 1,overflow: TextOverflow.ellipsis,),

            Text(" ${debitText.length>5?debitText.substring(0,4)+"..":debitText}",
              style: TextStyle(height: 1.8,color: Colors.green),overflow: TextOverflow.ellipsis,maxLines:1,),
          ],
        ),
      ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: index==1?[
        //     Icon(Icons.arrow_downward_sharp,color: Colors.green,size: 18,),
        //     Icon(Icons.arrow_upward,color: Colors.red,size: 18,),
        //   ]:index!%2==0?[
        //     Icon(Icons.arrow_downward_sharp,color: Colors.green,size: 18,),
        //   ]:[
        //     Icon(Icons.arrow_upward,color: Colors.red,size: 18,),
        //   ],
        // ),

      ],
    );
  }

}