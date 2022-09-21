import 'package:e_commerce/configs/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../configs/text_style.dart';
import '../../model/cash_book_model.dart';
import '../../provider/cash_book_provider.dart';
import '../../utils/functions.dart';

class DealerStatement extends StatefulWidget {
  const DealerStatement({Key? key}) : super(key: key);

  @override
  State<DealerStatement> createState() => _DealerStatementState();
}

class _DealerStatementState extends State<DealerStatement> {
  String? month;
  var day;
  var year;
  String?time;

  @override
  void initState() {
    // TODO: implement initState
    getFormatedDate(DateTime.now().toString());
    super.initState();
  }
  String date = DateTime.now().toString();
  @override
    Widget build(BuildContext context) {
      return Consumer<CashBookProvider>(builder: (context,cash,_){
        return

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.0,vertical: 12.0
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12.0)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(cash.cashBook!.result!.totalAmount.toString(),style: rsStyle),
                          Text("Total Amount",style: cashStyle)
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.0,vertical: 12.0
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12.0)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(cash.cashBook!.result!.totalReceived.toString(),style: rsStyle,),
                          Text("Total Recieved",style: cashStyle,),

                        ],
                      ),

                    ),
                  ),
                  Expanded(
                    child: Container(

                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.0,vertical: 12.0
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12.0)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("RS 0",style: rsStyle,),
                          Text("Remaining Balance",style: cashStyle,)
                        ],
                      ),
                    ),
                  ),


                ],
              ),
          SizedBox(height: 5.0,),
          Divider(
            color: Colors.black38,
            thickness: 1.0,
          ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Expanded(child: Text("Amount",style: titleStyle,)),
              //     Expanded(child: Text("Type",style: titleStyle,)),
              //     Expanded(child: Text("Date",style: titleStyle,)),
              //     Expanded(child: Text("Detail",style: titleStyle,)),
              //   ],
              // ) ,
              //   DealerStatementWidget(
              //     cash: cash.cashBook!.result!.voucherLines!,
              //   )
              Card(
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
                      title: Text("Reciver Name:\nMaqsood Ahmad",style: TextStyle(fontSize: 14),),
                      subtitle: Text("Paid Amount: 50,000",style: TextStyle(height: 1,color: bgColor)),
                      trailing:  Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: bgColor),
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text("Pending")),
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
                        child: Text("Transaction Type:   Online Transcation",style: titleStyle,))
                  ],
                ),
              )

            ],
          );
      });
    }
  getFormatedDate(_date) {
    DateTime dates = DateTime.parse(_date);
    month = DateFormat('MMMM').format(dates).substring(0, 3);
    print('month $month');
    day = dates.day;
    year=dates.year;
    time = DateFormat('hh:mm a').format(dates);
  }
}
class DealerStatementWidget extends StatelessWidget {
  List<VoucherLines> cash;
 DealerStatementWidget({required this.cash});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cash.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        primary: false,
        itemBuilder: (BuildContext,index){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Expanded(child: Text(cash[index].total.toString())),
          Expanded(child: Text(cash[index].receivedType==1?"Cash":cash[index].receivedType==2?"Bank":cash[index].receivedType==3?"Jazz Cash":cash[index].receivedType.toString())),
          Expanded(child: Text(Methods().getFormatedDate(cash[index].receivedDate!))),
          Expanded(child: Text(cash[index].amountReceivedDetail!)),
        ],
      );
    });
  }
}



