import 'package:flutter/material.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  String date = DateTime.now().toString();
  @override
    Widget build(BuildContext context) {
      return Consumer<CashBookProvider>(builder: (context,cash,_){
        return
          cash.cashBook != null ?
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text("Amount",style: titleStyle,)),
                  Expanded(child: Text("Type",style: titleStyle,)),
                  Expanded(child: Text("Date",style: titleStyle,)),
                  Expanded(child: Text("Detail",style: titleStyle,)),
                ],
              ) ,
                DealerStatementWidget(
                  cash: cash.cashBook!.result!.voucherLines!,
                )
            ],
          ):Container(
            height: 300.0,
            width: 400.0,
            color: Colors.red,
          );
      });
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



